import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/choice_button.dart';
import 'package:flutter_application_1/components/computer_choice_display.dart';
import 'dart:math';

import 'package:flutter_application_1/components/score_display.dart';

class JokempoPage extends StatefulWidget {
  const JokempoPage({super.key});

  @override
  State<JokempoPage> createState() => _JokempoPageState();
}

class _JokempoPageState extends State<JokempoPage> {
  int playerScore = 0;
  int computerScore = 0;
  String resultMessage = '';
  String computerChoice = '';

  final List<String> choices = ['PEDRA', 'PAPEL', 'TESOURA'];

  void playGame(String playerChoice) {
    final random = Random();
    computerChoice = choices[random.nextInt(choices.length)];

    if (playerChoice == computerChoice) {
      resultMessage = 'Empatou!';
    } else if ((playerChoice == 'PEDRA' && computerChoice == 'TESOURA') ||
        (playerChoice == 'PAPEL' && computerChoice == 'PEDRA') ||
        (playerChoice == 'TESOURA' && computerChoice == 'PAPEL')) {
      resultMessage = 'Você Venceu!';
      playerScore++;
    } else {
      resultMessage = 'Computador Venceu!';
      computerScore++;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[350],
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Row(
          children: [
            Icon(Icons.sports_baseball, size: 28),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                "Pedra, Papel e Tesoura",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              resultMessage,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: choices.map((choice) {
                return ChoiceButton(
                  choice: choice,
                  onTap: () => playGame(choice),
                );
              }).toList(),
            ),
            SizedBox(height: 50),
            ComputerChoiceDisplay(computerChoice: computerChoice),
            SizedBox(height: 20),
            ScoreDisplay(playerScore: playerScore, computerScore: computerScore),
          ],
        ),
      ),
    );
  }
}






