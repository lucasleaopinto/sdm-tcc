
import 'package:flutter/material.dart';
import 'package:perguntas/model/question.dart';
import 'package:perguntas/pages/result_page.dart';
import 'package:perguntas/view_model/question_view_model.dart';
import 'package:perguntas/widgets/answer_view.dart';
import 'package:perguntas/widgets/question_view.dart';
import 'package:provider/provider.dart';


class GamePageBody extends StatefulWidget {
  const GamePageBody({Key? key}) : super(key: key);

  @override
  State<GamePageBody> createState() {
    return _GamePageBodyState();
  }
}

class _GamePageBodyState extends State<GamePageBody> {
  late QuestionViewModel _viewModel;
  late Question _question;


  void onAnswer(int value){
    _viewModel.checkAnswer(value);

    if (_viewModel.gameOver){
      Navigator.pushNamed(
          context,
          ResultPage.routeName
      );
      return;
    }

    setState(() {
      _question = _viewModel.currentQuestion;
      _viewModel = _viewModel;
    });
  }

  @override
  Widget build(BuildContext context) {
    _viewModel = Provider.of<QuestionViewModel>(context);
    _question = _viewModel.currentQuestion;

    return Column(
      children: <Widget>[
        Flexible(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            height: double.infinity,
            child: QuestionView(
                "${_question.multiply} X ${_question.multiplying} ?",
            ),
          ),
        ),
        Flexible(
          flex: 1,
          fit: FlexFit.tight,
          child: Wrap(
            runAlignment: WrapAlignment.center,
            alignment: WrapAlignment.spaceEvenly,
            runSpacing: 10.0,
            spacing: 10.0,
            children: <Widget>[
              ..._question.answers
                  .map((a) =>
                    AnswerView(a, () => onAnswer(a.value),
                  ),
              ).toList(),
            ],
          ),
        ),
      ],
    );
  }
}
