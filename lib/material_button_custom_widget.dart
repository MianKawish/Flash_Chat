import 'package:flutter/material.dart';

class MaterialButtonWidget extends StatelessWidget {
  const MaterialButtonWidget(
      {super.key,
      required this.customText,
      required this.function,
      required this.color});

  final String customText;
  final Color color;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: function,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            customText,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
