import 'package:flutter/material.dart';
import 'package:perguntas/pages/game_page.dart';
import 'package:perguntas/pages/home_page.dart';
import 'package:perguntas/pages/result_page.dart';
import 'package:perguntas/view_model/question_view_model.dart';
import 'package:perguntas/view_model/times_table_view_model.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: TimesTableViewModel()),
        ChangeNotifierProvider.value(value: QuestionViewModel()),
      ],
      child:  MaterialApp(
        initialRoute: HomePage.routeName,
        routes: {
          HomePage.routeName: (context) => HomePage(),
          GamePage.routeName: (context) => GamePage(),
          ResultPage.routeName: (context) => ResultPage(),
        },
      ),
    );
  }
}
