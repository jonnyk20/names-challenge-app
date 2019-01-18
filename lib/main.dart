import 'package:flutter/material.dart';
import 'src/app.dart';
import 'package:redux/redux.dart';
import './src/reducers/reducers.dart';
import './src/models/app_state_model.dart';

void main() {
  final store = new Store<AppState>(
    appReducers,
    initialState: AppState.initial,
  );
  runApp(App(store));
}
