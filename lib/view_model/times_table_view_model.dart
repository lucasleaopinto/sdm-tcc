import 'package:flutter/material.dart';
import 'package:perguntas/repository/times_table_repository.dart';

class TimesTableViewModel with ChangeNotifier {
  TimesTableRepository _repository = TimesTableRepository();

  List<int> get available {
    return _repository.timesTableAvailable();
  }
}