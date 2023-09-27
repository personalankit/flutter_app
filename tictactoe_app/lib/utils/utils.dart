/* ScaffoldMessenger and Modal have similarities in displaying 
transient messages without disrupting the UI, they are used for 
different purposes in their respective frameworks. Modal in 
React is more focused on displaying popups or modal dialogs 
with user interaction, while ScaffoldMessenger in Flutter is 
specifically designed for showing SnackBars and Toasts in a 
more flexible and convenient manner. */

import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}
