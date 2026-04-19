import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final Color? color;
  final VoidCallback action;

  const CalcButton({super.key, required this.text, this.color, required this.action});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? const Color(0xFF333333),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      onPressed: action,
      child: Text(text, style: TextStyle(fontSize: text.length > 2 ? 14 : 20, fontWeight: FontWeight.bold)),
    );
  }
}