import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe_app/provider/room_data_provider.dart';
import 'package:tictactoe_app/responsive/responsive.dart';
import 'package:tictactoe_app/widgets/custom_textfield.dart';

class WaitingLobby extends StatefulWidget {
  const WaitingLobby({super.key});

  @override
  State<WaitingLobby> createState() => _WaitingLobbyState();
}

class _WaitingLobbyState extends State<WaitingLobby> {
  late TextEditingController roomIdController;

  @override
  void initState() {
    super.initState();
    // here we get our _id from store [ which is provider ] an store it in TextEditingController
    roomIdController = TextEditingController(
      text:
          Provider.of<RoomDataProvider>(context, listen: false).roomData['_id'],
    );
  }

  @override
  void dispose() {
    super.dispose();
    roomIdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Waiting for Player to Join......',
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(height: 20),
            CustomTextField(
              // here we are showing the _id of the created room
              controller: roomIdController,
              hintText: '',
              isReadOnly: true,
            )
          ],
        ),
      ),
    );
  }
}
