import 'package:flutter/material.dart';
import './widgets/card_list.dart';
import 'people_fixture.dart';

class App extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Names Challenge',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Names Challenge'),
          ),
          body: CardList(peopleList),
        ));
  }
}
