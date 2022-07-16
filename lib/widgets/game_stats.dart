import 'package:flutter/material.dart';
import 'package:perguntas/util/dimens.dart';

class GameStats extends StatelessWidget {
  final int correctAnswers;
  final int wrongAnswers;
  final int score;

  const GameStats({
    Key? key,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.score,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    var normal = theme.textTheme.headline6;

    var correct = normal?.copyWith(color: Colors.green);

    var wrong = normal?.copyWith(color: Colors.red);

    return Container(
      padding: EdgeInsets.all(padding),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                "Perguntas respondidas",
                style: normal,
              )),
              Text(
                (correctAnswers + wrongAnswers).toString(),
                style: normal,
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: Text(
                "Respostas corretas",
                style: correct,
              )),
              Text(
                correctAnswers.toString(),
                style: correct,
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: Text(
                "Respostas erradas",
                style: wrong,
              )),
              Text(
                wrongAnswers.toString(),
                style: wrong,
              )
            ],
          ),
          Padding(
            padding:
                EdgeInsets.fromLTRB(0, padding * 3, 0, 0),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  "Pontuação obtida",
                  style: normal,
                )),
                Text(
                  score.toString(),
                  style: normal,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
