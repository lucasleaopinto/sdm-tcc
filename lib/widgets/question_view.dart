import 'package:flutter/material.dart';

class QuestionView extends StatelessWidget {
  final String text;

  const QuestionView(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(20),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 46),
        ),
    );
  }
}
