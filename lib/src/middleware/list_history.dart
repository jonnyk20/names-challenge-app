import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:redux/redux.dart';

import '../actions/actions.dart';
import '../models/app_state_model.dart';

const String APP_STATE_KEY = "NAMES_CHALLENGE_APP_STATE";

void listHistoryMiddleware(Store<AppState> store, action, NextDispatcher next) {
  next(action);

  // if (action is ChangeLastIndex || action is ChangeListSize) {
  //   saveStateToPrefs(store.state);
  // }

  // if (action is RetrieveStateFromStorage) {
  //   loadStateFromPrefs().then((state) {
  //     store.dispatch(new LoadStateFromStorage(state));
  //   });
  // }
}

void saveStateToPrefs(AppState state) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var stateString = json.encode(state.toJson());
  await preferences.setString(APP_STATE_KEY, stateString);
}

Future<AppState> loadStateFromPrefs() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var stateString = preferences.getString(APP_STATE_KEY);
  Map stateMap = json.decode(stateString);
  return new AppState.fromJson(stateMap);
}

void clearSettings() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.remove(APP_STATE_KEY);
}
