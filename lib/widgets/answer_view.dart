import 'package:flutter/material.dart';
import 'package:perguntas/model/answer.dart';

class AnswerView extends StatelessWidget {
  final Answer answer;
  final void Function() onSelect;

  const AnswerView(this.answer, this.onSelect);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    var style = ButtonStyle(
      minimumSize: MaterialStateProperty.all(Size(
          MediaQuery.of(context).size.width * 0.40,
          100,
      )),
      overlayColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed))
                  return answer.correct ? Colors.lightGreen : Colors.red;
                if (states.contains(MaterialState.selected))
                  return answer.correct ? Colors.lightGreen : Colors.red;
                return theme.elevatedButtonTheme.style?.overlayColor?.resolve(states) ?? theme.colorScheme.primary;
              }),
    );

    print("style: $style");

    return Flexible(
      fit: FlexFit.tight,
      flex: 1,
      child: ElevatedButton(
        style: style,
        child: Text(
          answer.value.toString(),
          style: theme.textTheme.headline4?.copyWith(
            color: theme.colorScheme.surface
          ),
        ),
        onPressed: onSelect,
      ),
      // child: ButtonTheme(
      //   minWidth: MediaQuery.of(context).size.width * 0.40,
      //   height: 100,
      //   child: RaisedButton(
      //     child: Text(resposta, style: TextStyle(fontSize: 28)),
      //     onPressed: selecao,
      //   ),
      //   // textColor: Colors.white,
      //   // color: Colors.blue,
      // ),
    );
  }
}
