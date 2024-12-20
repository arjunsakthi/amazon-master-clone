import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback ontap;
  final Color? color;
  const CustomButton(
      {super.key, required this.ontap, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ontap,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: color,
      ),
      child: Text(
        text,
        style: TextStyle(color: color == null ? Colors.white : Colors.black87),
      ),
    );
  }
}
