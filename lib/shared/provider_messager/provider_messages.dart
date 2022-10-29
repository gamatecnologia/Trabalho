import 'package:flutter/material.dart';

class ProviderMessager {
  showMessage(String text, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }
}
