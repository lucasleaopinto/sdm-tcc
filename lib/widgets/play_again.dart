import 'package:flutter/material.dart';
import 'package:perguntas/pages/home_page.dart';
import 'package:perguntas/util/dimens.dart';

class PlayAgain extends StatelessWidget {
  const PlayAgain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(padding, padding * 4, padding, padding),
      child: Column(
        children: [
          Text("Que tal jogar mais uma partida, topa?"),
          ElevatedButton(
              onPressed: (){
                Navigator.popUntil(context, ModalRoute.withName(HomePage.routeName));
              },
              child: Text("Sim, bora!"),
          ),
        ],
      ),
    );
  }
}
