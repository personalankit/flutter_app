import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe_app/provider/room_data_provider.dart';
import 'package:tictactoe_app/screens/create_room_screen.dart';
import 'package:tictactoe_app/screens/game_screen.dart';
import 'package:tictactoe_app/screens/join_room_screen.dart';
import 'package:tictactoe_app/screens/main_menu_screens.dart';
import 'package:tictactoe_app/utils/color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RoomDataProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',

        /* The copyWith() pattern is particularly helpful when dealing with classes 
        that have many properties and you want to create variations of objects with 
        only a few properties changed. By using copyWith(), you can efficiently 
        create new instances without modifying the original objects. */

        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor,
        ),
        routes: {
          MainMenuScreen.routeName: (context) => const MainMenuScreen(),
          '/createroom': (context) => const CreateRoom(),
          '/joinroom': (context) => const JoinRoom(),
          '/gamescreen': (context) => const GameScreen(),
        },
        initialRoute: MainMenuScreen.routeName,
      ),
    );
  }
}
