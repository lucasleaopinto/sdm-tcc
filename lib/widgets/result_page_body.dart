import 'package:flutter/material.dart';
import 'package:perguntas/view_model/question_view_model.dart';
import 'package:perguntas/widgets/game_stats.dart';
import 'package:perguntas/widgets/play_again.dart';
import 'package:provider/provider.dart';

class ResultPageBody extends StatefulWidget {
  const ResultPageBody({Key? key}) : super(key: key);

  @override
  State<ResultPageBody> createState() => _ResultPageBodyState();
}

class _ResultPageBodyState extends State<ResultPageBody> {
  @override
  Widget build(BuildContext context) {
    var timesTables = Provider.of<QuestionViewModel>(context);

    var correctAnswers = timesTables.correctAnswers;
    var wrongAnswers = timesTables.wrongAnswers;
    var score = timesTables.score;

    return Container(
      child: Column(
        children: [
          GameStats(
            correctAnswers: correctAnswers,
            wrongAnswers: wrongAnswers,
            score: score,
          ),
          PlayAgain(),
        ],
      ),
    );
  }
}
