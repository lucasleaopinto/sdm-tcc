import 'package:flutter/material.dart';
import 'package:perguntas/widgets/home_page_body.dart';

class HomePage extends StatelessWidget {
  static const routeName = "/";

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePageBody(),
    );
  }
}


