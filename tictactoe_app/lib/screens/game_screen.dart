import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe_app/provider/room_data_provider.dart';
import 'package:tictactoe_app/resourses/socket_methods.dart';
import 'package:tictactoe_app/views/scoreboard.dart';
import 'package:tictactoe_app/views/tictactoe_borad.dart';
import 'package:tictactoe_app/views/waiting_lobby.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.updateRoomListener(context);
    _socketMethods.updatePlayersStateListener(context);
  }

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);
    return Scaffold(
        body: roomDataProvider.roomData['isJoin']
            ? const WaitingLobby()
            : SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [const ScoreBoard(), const TicTacToeBoard()],
                ),
              ));
  }
}
