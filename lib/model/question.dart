import 'package:perguntas/model/answer.dart';

class Question{
  final int multiply;
  final int multiplying;
  final int score;
  final List<Answer> answers;
  late Answer selectedAnswer;

  Question(this.multiply, this.multiplying, this.score, this.answers);

  void selectAnswer(int value){
    selectedAnswer = answers.where((a) => a.value == value).first;
  }

  bool isCorrect(){
    return selectedAnswer.correct;
  }
}