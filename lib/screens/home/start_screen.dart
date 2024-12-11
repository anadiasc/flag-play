import 'package:flag_play/screens/questions/question_screen.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Flag Play',
            style: TextStyle(color: Color(0xFF0A4F86),fontSize: 25, fontWeight: FontWeight.bold,),
          ),
          const SizedBox(height: 10),
          const Text(
            'Acerte o máximo de bandeiras de países em:',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),
          ),
          const SizedBox(height: 30),
          GestureDetector( //acertar as bandeiras em 30s
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuestionScreen(time:30)),
              );
            },
            child: Container(
              width: 150,
              height: 100,
              decoration: BoxDecoration(
                //color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: const Color(0xFF0A4F86), // Cor da borda
                  width: 1.0, // Largura da borda
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [const Center(
                  child: const Text(
                      '30s',
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18), //color: Colors.white,
                    ),
                  ),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),
          GestureDetector( //acertar as bandeiras em 60s
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuestionScreen(time:60)),
              );
            },
            child: Container(
               width: 150,
              height: 100,
              decoration: BoxDecoration(
                //color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: const Color(0xFF0A4F86), // Cor da borda
                  width: 1.0, // Largura da borda
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [const Center(
                  child: const Text(
                      '60s',
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18), //color: Colors.white,
                    ),
                  ),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),
          ),

          const SizedBox(height: 30),
          GestureDetector( //acertar as bandeiras em 120s
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuestionScreen(time:120)),
              );
            },
            child: Container(
              width: 150,
              height: 100,
              decoration: BoxDecoration(
                //color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: const Color(0xFF0A4F86), // Cor da borda
                  width: 1.0, // Largura da borda
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [const Center(
                  child: const Text(
                      '120s',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), //color: Colors.white,
                    ),
                  ),
                  Icon(Icons.arrow_forward),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


