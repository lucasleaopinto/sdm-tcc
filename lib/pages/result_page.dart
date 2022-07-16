import 'package:flutter/material.dart';
import 'package:perguntas/widgets/result_page_body.dart';

class ResultPage extends StatelessWidget {
  static const routeName = "/result";

  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jogo de Tabuada"),
      ),
      body: ResultPageBody(),
    );
  }
}
