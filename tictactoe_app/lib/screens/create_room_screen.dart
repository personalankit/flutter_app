import 'package:flutter/material.dart';
import 'package:tictactoe_app/resourses/socket_methods.dart';
import 'package:tictactoe_app/responsive/responsive.dart';
import 'package:tictactoe_app/widgets/custom_button.dart';
import 'package:tictactoe_app/widgets/custom_text.dart';
import 'package:tictactoe_app/widgets/custom_textfield.dart';

class CreateRoom extends StatefulWidget {
  const CreateRoom({super.key});

  @override
  State<CreateRoom> createState() => _CreateRoomState();
}

class _CreateRoomState extends State<CreateRoom> {
  final TextEditingController _nameController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.createRoomSuccessListener(context);
  }

  @override
  void dispose() {
    super.dispose();
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
                text: 'Create Room',
                fontSize: 70,
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
              CustomButton(
                onTap: () => _socketMethods.createRoom(_nameController.text),
                text: 'Create',
              )
            ],
          ),
        ),
      ),
    );
  }
}
