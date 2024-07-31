import 'dart:developer';

import 'package:app02/frontend/data/questions.dart';
import 'package:app02/frontend/screens/home.dart';
import 'package:app02/frontend/screens/question.dart';
import 'package:app02/frontend/screens/result.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  List<String> selectedAnswers = [];

  void chooseAnswer(String answer) {
    log(answer);
    selectedAnswers.add(answer);
    if(selectedAnswers.length == questions.length) {
      setState(() {
        selectedAnswers = [];
        activeScreen = const Result(); //Home(switchScreen);
      });
      log(selectedAnswers.toString());
    }
  }

  Widget? activeScreen;

  @override
  void initState() {
    super.initState();
    activeScreen = Home(switchScreen);
  }

  void switchScreen() {
    setState(() {
      activeScreen = Question(chooseAnswer);
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurpleAccent,
                Colors.purpleAccent,
              ],
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
