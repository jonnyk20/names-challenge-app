import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import './screens/home.dart';
import './screens/meet.dart';
import './screens/remember.dart';
import './models/person_model.dart';

class App extends StatelessWidget {
  final Store<List<Person>> store;

  App(this.store);

  Widget build(BuildContext context) {
    return new StoreProvider<List<Person>>(
        store: store,
        child: MaterialApp(
          title: 'Names Challenge',
          routes: {
            // When we navigate to the "/" route, build the FirstScreen Widget
            '/': (context) => Home(),
            // When we navigate to the "/second" route, build the SecondScreen Widget
            '/meet': (context) => Meet(),
            '/remember': (context) => Remember(),
          },
        ));
  }
}
