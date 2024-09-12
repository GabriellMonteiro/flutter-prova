import 'package:flutter/material.dart';

class ComputerChoiceDisplay extends StatelessWidget {
  final String computerChoice;

  const ComputerChoiceDisplay({
    required this.computerChoice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
        backgroundImage: computerChoice.isNotEmpty
            ? AssetImage('assets/images/${computerChoice}.png')
            : null,
        child: computerChoice.isEmpty
            ? Text(
                'Escolha',
                style: TextStyle(color: Colors.white),
              )
            : null,
      ),
    );
  }
}