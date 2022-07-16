import 'package:flutter/material.dart';
import 'package:perguntas/widgets/game_page_body.dart';

class GamePage extends StatelessWidget {
  static const routeName = "/game";

  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jogo de Tabuada"),
      ),
      body: GamePageBody(),
    );
  }
}
