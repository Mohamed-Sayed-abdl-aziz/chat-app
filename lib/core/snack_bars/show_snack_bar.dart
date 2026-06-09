import 'package:flutter/material.dart';

abstract class ShowSnackBar {
  static void showSnackBarForAuth(BuildContext context, String massge) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(massge)));
  }
}
