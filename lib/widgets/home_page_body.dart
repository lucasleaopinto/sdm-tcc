import 'dart:math';

import 'package:flutter/material.dart';
import 'package:perguntas/pages/game_page.dart';
import 'package:perguntas/util/dimens.dart';
import 'package:perguntas/view_model/question_view_model.dart';
import 'package:perguntas/view_model/times_table_view_model.dart';
import 'package:provider/provider.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  int selectedTimesTable = Random().nextInt(10) + 1;
  late QuestionViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    _viewModel = Provider.of<QuestionViewModel>(context);
    var timesTableAvailable = Provider.of<TimesTableViewModel>(context).available;

    return SafeArea(
      child: Container(
        color: theme.colorScheme.primary,
        padding: EdgeInsets.all(padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: titlePadding),
                  child: Text(
                    "Jogo de Tabuada",
                    style: theme.textTheme.headline3?.copyWith(
                      color: theme.colorScheme.surface,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Escolha uma tabuada para jogar",
                      style: theme.textTheme.bodyText1?.copyWith(
                        color: theme.colorScheme.surface,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: padding),
                      child: buildTimesTableDropDown(timesTableAvailable),
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: navigateToGamePage,
                    child: Text("Vamos Jogar!"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildTimesTableDropDown(List<int> timesTableAvailable) {
    var theme = Theme.of(context);

    return DropdownButton<int>(
      value: selectedTimesTable,
      elevation: 16,
      style: theme.textTheme.bodyText1,
      onChanged: (int? newValue) {
        setState(() {
          selectedTimesTable = newValue!;
        });
      },
      items: timesTableAvailable
          .map((e) => DropdownMenuItem<int>(
                value: e,
                child: Text(e.toString()),
              ))
          .toList(),
    );
  }

  void navigateToGamePage(){
    _viewModel.init(selectedTimesTable);

    Navigator.pushNamed(
        context,
        GamePage.routeName
    );
  }
}
