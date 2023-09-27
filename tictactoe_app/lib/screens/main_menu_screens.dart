import 'package:flutter/material.dart';
import 'package:tictactoe_app/responsive/responsive.dart';
import 'package:tictactoe_app/widgets/custom_button.dart';

class MainMenuScreen extends StatelessWidget {
  static String routeName = '/main-menu';
  const MainMenuScreen({super.key});

  void createRoom(BuildContext context) {
    Navigator.pushNamed(context, '/createroom');
  }

  void joinRoom(BuildContext context) {
    Navigator.pushNamed(context, '/joinroom');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                onTap: () => createRoom(context),
                text: 'Create Room',
              ),
              const SizedBox(height: 20),
              CustomButton(
                onTap: () => joinRoom(context),
                text: 'Join Room',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
