import 'package:flutter/material.dart';

class ChoiceButton extends StatelessWidget {
  final String choice;
  final VoidCallback onTap;

  const ChoiceButton({
    required this.choice,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    String imagePath = 'assets/images/${choice}.png';

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 5,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: CircleAvatar(
          radius: 60,
          backgroundImage: AssetImage(imagePath),
        ),
      ),
    );
  }
}