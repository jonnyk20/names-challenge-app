import 'package:flutter/material.dart';
import 'src/app.dart';
import 'package:redux/redux.dart';
import './src/models/person_model.dart';
import './src/reducers/index.dart';
import './src/people_fixture.dart';

void main() {
  final store = new Store<List<Person>>(appReducers, initialState: peopleList);
  runApp(App(store));
}
