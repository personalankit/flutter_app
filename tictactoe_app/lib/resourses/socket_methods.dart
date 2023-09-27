import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe_app/utils/utils.dart';
import '../provider/room_data_provider.dart';

import './socket_client.dart';

class SocketMethods {
  final _socketClient = SocketClient.instance.socket!;
  // This emit method is used to send data over a socket connection to the server.
  void createRoom(String nickname) {
    if (nickname.isNotEmpty) {
      _socketClient.emit('createRoom', {
        'nickname': nickname,
      });
    }
  }

  // And this is the same process, we have done with createRoom send data to server
  void joinRoom(String nickname, String roomId) {
    if (nickname.isNotEmpty && roomId.isNotEmpty) {
      _socketClient.emit('joinRoom', {
        'nickname': nickname,
        'roomId': roomId,
      });
    }
  }

  /*This emit method is used to receive or listen to our server side and connect to it and get data back*/
  void createRoomSuccessListener(BuildContext context) {
    _socketClient.on('createRoomSuccess', (room) {
      /* Here we are using Provide [ it's kind of a redux not exactly redux ] to 
      store the data we get from serve and store it in our provider class and get 
      it through out our app */
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      Navigator.pushNamed(context, '/gamescreen');
    });
  }

  // This is also as same our createRoomListener getting data from server
  void joinRoomSuccessListener(BuildContext context) {
    _socketClient.on('joinRoomSuccess', (room) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(room);
      Navigator.pushNamed(context, '/gamescreen');
    });
  }

  // This is for error message we get from server if something went wrong
  void errorOccurredListener(BuildContext context) {
    _socketClient.on('errorOccurred', (data) {
      showSnackBar(context, data);
    });
  }

  void updatePlayersStateListener(BuildContext context) {
    _socketClient.on('updatePlayers', (playerData) {
      Provider.of<RoomDataProvider>(context, listen: false).updatePlayer1(
        playerData[0],
      );
      Provider.of<RoomDataProvider>(context, listen: false).updatePlayer2(
        playerData[1],
      );
    });
  }

  // we are updating the join user, and storing to our store<Provider> and will
  // get it in our game screen as soon as our second player join
  void updateRoomListener(BuildContext context) {
    _socketClient.on('updateRoom', (data) {
      Provider.of<RoomDataProvider>(context, listen: false)
          .updateRoomData(data);
    });
  }
}
