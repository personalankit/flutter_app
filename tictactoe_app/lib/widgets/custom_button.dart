import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;

  /// VoidCallback are equivalent to onPress in React Native
  final String text;

  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    // this is getting our current screens width
    final width = MediaQuery.of(context).size.width;

    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 77, 170, 246),
            blurRadius: 5,
            spreadRadius: 0,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(
            width,
            50,
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
