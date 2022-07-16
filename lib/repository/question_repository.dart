import 'package:perguntas/model/answer.dart';
import 'package:perguntas/model/question.dart';
import 'package:perguntas/repository/times_table_repository.dart';

class QuestionRepository {
  TimesTableRepository _timesTableRepository = TimesTableRepository();

  List<Question> getQuestions(int multiply){
    var available = List<int>.from(_timesTableRepository.timesTableAvailable());
    available.shuffle();

    return available.map((int item) => Question(
      multiply,
      item,
      1,
      generateAnswers(multiply * item),
    )).toList();
  }

  List<Answer> generateAnswers(int value){
    List range = [-3, -2, -1, 1, 2, 3];
    range.shuffle();
    range.removeRange(2, 5);

    var result = List<Answer>.generate(
        1, (i) => Answer(value, true)
    );

    result.addAll(range.map((e) => Answer(e + value, false)));
    result.shuffle();

    return result;
  }
}