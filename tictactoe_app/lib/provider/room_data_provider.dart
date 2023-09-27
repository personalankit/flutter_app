// the provided code demonstrates the concept of encapsulation in object-oriented programming.

import 'package:flutter/material.dart';
import 'package:tictactoe_app/models/players.dart';

class RoomDataProvider extends ChangeNotifier {
  // This is a provider [ like store in Redux ]
  Map<String, dynamic> _roomData = {}; // Map empty variable
  Player _player1 = Player(
    nickname: '',
    socketID: '',
    points: 0,
    playerType: 'X',
  );
  Player _player2 = Player(
    nickname: '',
    socketID: '',
    points: 0,
    playerType: 'O',
  );

  Map<String, dynamic> get roomData =>
      _roomData; // from this we can access that data in any other classes that why it is getter
  Player get player1 => _player1;
  Player get player2 => _player2;

  /* All below line of code ensure that what ever data will come as an parameter in this 
   method, that will be stored in our Map variable above */ // in our case room data from serve in our socket_method will be getting as parameter
  void updateRoomData(Map<String, dynamic> data) {
    _roomData = data;
    notifyListeners();
  }

  void updatePlayer1(Map<String, dynamic> player1Data) {
    _player1 = Player.fromMap(player1Data);
    notifyListeners();
  }

  void updatePlayer2(Map<String, dynamic> player2Data) {
    _player2 = Player.fromMap(player2Data);
    notifyListeners();
  }
}

/* RoomDataProvider class acts as a provider or "store" in Flutter, holding and managing the state for a specific "room." The updateRoomData method allows other parts of the application to update the data in the provider, and any widgets that are listening to this provider will be notified of the changes and can react accordingly to update their UI. This kind of state management is useful for building reactive UIs that respond to changes in the data. */
