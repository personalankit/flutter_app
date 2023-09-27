import express from 'express';
import http from 'http';
import { Server } from 'socket.io';
import 'dotenv/config';
import { gameModel } from './models/room.js'
import { mongoDb } from './db.js';
mongoDb();

const app = express();

const port = process.env.PORT;

const server = http.createServer(app);
const io = new Server(server);

app.use(express.json());

io.on('connection', (socket) => {
    console.log(`⚡️user socket`);
    // here we are listening to our client request
    socket.on('createRoom', async ({ nickname }) => {
        try {
            let room = new gameModel();
            let players = {
                socketID: socket.id,
                nickname: nickname,
                playerType: 'X',
            };
            room.players.push(players);
            // This line sets the room.turn property to the players
            room.turn = players;
            // we are saving data in our DataBase
            room = await room.save();
            /* As soon as the database operation is completed successfully, 
            the promise is resolved with the updated room instance, which now 
            reflects the data saved in the database. This instance is then 
            assigned back to the room variable, so you have access 
            to the latest data in the local instance. */
            const roomId = room._id.toString();

            /* when we join the room in the existing game play it will go only to 
             the particulars room, that is specified */
            socket.join(roomId);
            // socket -> sending data to yourself
            // io -> send data to everyone
            io.to(roomId).emit('createRoomSuccess', room); /* we are sending data 
            to everyone present in the room in the client & as we listening to our 
            client request above [createRoom] we have do as same in our client as 
            well */
        } catch (error) {
            console.log(error);
        };
    });

    // This implementation is quite different from create Room functionality
    socket.on('joinRoom', async ({ nickname, roomId }) => {
        try {
            /* first we have to match roomId with RegEx pattern then 
            check if it's not the proper id then return it from here 
            and don't go forward, if id is valid then go forward and 
            execute forward logic*/
            if (!roomId.match(/^[0-9a-fA-F]{24}$/)) {
                socket.emit('errorOccurred', 'Please enter valid room ID');
                return;
            }
            // again we are creating instance of modal
            let room = await gameModel.findById(roomId);

            /* The isJoin property likely indicates whether players can 
            join the room. If isJoin is true, it means the room is 
            available for joining, and the user can proceed to join the room. */
            if (room.isJoin) {
                /* If the room is available for joining, the code creates a new 
                player object with properties nickname, socketID, and playerType */
                let player = {
                    nickname: nickname,
                    socketID: socket.id,
                    playerType: 'O',
                };
                /* If the room is joinable, the server joins the current socket 
                 (user) to the specified room using socket.join(roomId) */
                socket.join(roomId);
                room.players.push(player);
                room.isJoin = false;
                room = await room.save();

                /* This line of code uses the io object to emit a custom event called 
                'joinRoomSuccess' to all sockets connected to a specific room indicated
                by roomId. The purpose of this event is to notify all clients in that
                  room that a new player has successfully joined the room. */
                io.to(roomId).emit('joinRoomSuccess', room);
                io.to(roomId).emit('updatePlayers', room.players);
                io.to(roomId).emit('updateRoom', room);
            } else {
                /* If the room.isJoin property is false, it indicates that the 
                game is already in progress, and new players cannot join the room */
                socket.emit('errorOccurred', 'Game is in Play! Try Again Later.');
            }
        } catch (error) {
            console.log(error);
        }
    })
});

server.listen(port, () => {
    console.log(`⚡️[server]: Server is running at ${port}`);
});
