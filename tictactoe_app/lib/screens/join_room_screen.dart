import 'package:flutter/material.dart';
import 'package:tictactoe_app/resourses/socket_methods.dart';
import 'package:tictactoe_app/responsive/responsive.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textfield.dart';

class JoinRoom extends StatefulWidget {
  const JoinRoom({super.key});

  @override
  State<JoinRoom> createState() => _JoinRoomState();
}

class _JoinRoomState extends State<JoinRoom> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _gameIdController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.joinRoomSuccessListener(context);
    _socketMethods.errorOccurredListener(context);
    _socketMethods.updatePlayersStateListener(context);
  }

  @override
  void dispose() {
    super.dispose();
    _gameIdController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomText(
                text: 'Join Room',
                fontSize: 80,
                shadows: [
                  Shadow(
                    blurRadius: 40,
                    color: Colors.blue,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _nameController,
                hintText: 'Enter your nickname',
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _gameIdController,
                hintText: 'Enter you ID',
              ),
              const SizedBox(height: 20),
              CustomButton(
                onTap: () => _socketMethods.joinRoom(
                    _nameController.text, _gameIdController.text),
                text: 'Join',
              )
            ],
          ),
        ),
      ),
    );
  }
}
