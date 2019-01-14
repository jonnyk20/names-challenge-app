import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import './widgets/card_list.dart';
import './models/person_model.dart';

class App extends StatelessWidget {
  final Store<List<Person>> store;

  App(this.store);

  Widget build(BuildContext context) {
    return new StoreProvider<List<Person>>(
      store: store,
      child: MaterialApp(
          title: 'Names Challenge',
          home: Scaffold(
            appBar: AppBar(
              title: Text('Names Challenge'),
            ),
            body: CardList(),
          )),
    );
  }
}
