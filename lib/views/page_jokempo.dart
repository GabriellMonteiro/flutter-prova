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

  final List<String> choices = ['PEDRA', 'PAPEL', 'TESOURA'];

  @override
  void dispose() {
    text.dispose();
    super.dispose();
  }

  void playGame(String playerChoice) {
    final random = Random();
    String computerChoice = choices[random.nextInt(choices.length)];

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
        backgroundColor: const Color.fromARGB(255, 32, 245, 39),
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
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(imagePath),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 50),
            Text(
              'COMPUTADOR: ${choices[Random().nextInt(choices.length)].toUpperCase()}',
              style: TextStyle(fontSize: 16),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              margin: EdgeInsets.symmetric(vertical: 10.0),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                'Você: $playerScore  |  Computador: $computerScore',
                style: const TextStyle(
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