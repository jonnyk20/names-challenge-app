import 'package:flutter/material.dart';
import 'src/app.dart';
import 'package:redux_dev_tools/redux_dev_tools.dart';
import './src/reducers/reducers.dart';
import './src/models/app_state_model.dart';

void main() {
  final store =
      new DevToolsStore<AppState>(appReducers, initialState: AppState.dev);

  runApp(App(store));
}
