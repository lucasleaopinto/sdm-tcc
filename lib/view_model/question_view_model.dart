import 'package:flutter/material.dart';
import 'package:perguntas/model/question.dart';
import 'package:perguntas/repository/question_repository.dart';

class QuestionViewModel with ChangeNotifier {
  QuestionRepository _repository = QuestionRepository();

  late int multiply;
  late Question _question;
  late List<Question> _questions;

  late int _score;
  late int _correctAnswers;
  late int _wrongAnswers;
  late int _index;

  late bool _gameOver;

  void init(int multiply){
    _questions = _repository.getQuestions(multiply);

    _score = 0;
    _correctAnswers = 0;
    _wrongAnswers = 0;
    _index = 0;

    _gameOver = false;

    next();
  }

  get gameOver => _gameOver;
  get correctAnswers => _correctAnswers;
  get wrongAnswers => _wrongAnswers;
  get score => _score;
  get currentQuestion => _question;

  void checkAnswer(int value){
    if (_gameOver){
      return;
    }

    _question.selectAnswer(value);

    if (_question.isCorrect()){
      _correctAnswers++;
      _score += _question.score;
    } else {
      _wrongAnswers++;
    }

    _index++;
    _gameOver = _index >= _questions.length;
    next();
  }

  void next(){
    if (_gameOver){
      return;
    }

    _question = _questions[_index];
  }
}