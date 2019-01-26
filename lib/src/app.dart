import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import './screens/home.dart';
import './screens/meet.dart';
import './screens/remember.dart';
import './screens/settings.dart';
import './models/app_state_model.dart';
import './actions/actions.dart';

class App extends StatelessWidget {
  final Store<AppState> store;

  App(this.store);

  Widget build(BuildContext context) {
    return new StoreProvider<AppState>(
        store: store,
        child: StoreBuilder<AppState>(
            onInit: (store) => store.dispatch(RetrieveStateFromStorage()),
            builder: (context, store) {
              return MaterialApp(title: 'Names Challenge', routes: {
                // When we navigate to the "/" route, build the FirstScreen Widget
                '/': (context) => Home(),
                // When we navigate to the "/second" route, build the SecondScreen Widget
                '/meet': (context) => Meet(),
                '/remember': (context) => Remember(),
                '/settings': (context) => Settings(),
              });
            }));
  }
}
