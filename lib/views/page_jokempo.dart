import 'package:flutter/material.dart';
import 'dart:math';

class JokempoPage extends StatefulWidget {
  const JokempoPage({super.key});

  @override
  State<JokempoPage> createState() => _JokempoPageState();
}

class _JokempoPageState extends State<JokempoPage> {
  TextEditingController text = TextEditingController();
  int playerScore = 0;
  int computerScore = 0;
  String resultMessage = '';
  String computerChoice = '';

  final List<String> choices = ['PEDRA', 'PAPEL', 'TESOURA'];

  @override
  void dispose() {
    text.dispose();
    super.dispose();
  }

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
                String imagePath = 'assets/images/${choice}.png';
                return GestureDetector(
                  onTap: () => playGame(choice),
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
              }).toList(),
            ),
            SizedBox(height: 50),
            Container(
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
            ),
            SizedBox(height: 20),
            Text(
              'COMPUTADOR: ${computerChoice.toUpperCase()}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Text(
                'Você: $playerScore  |  Computador: $computerScore',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
