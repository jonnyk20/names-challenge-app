import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:redux/redux.dart';
import 'package:http/http.dart' as http;

import '../actions/actions.dart';
import '../models/app_state_model.dart';
import '../models/person_model.dart';

const String APP_STATE_KEY = "NAMES_CHALLENGE_APP_STATE";

void listHistoryMiddleware(Store<AppState> store, action, NextDispatcher next) {
  next(action);

  if (action is ChangeLastIndex) {
    if (store.state.lastIndex + 1 + store.state.listSize >=
        store.state.people.last.id) {
      print("Fetching More");
      fetchPeople(store.state.lastIndex, store.dispatch);
    }

    // if (action is ChangeLastIndex || action is ChangeListSize) {
    //   saveStateToPrefs(store.state);
    // }

    // if (action is RetrieveStateFromStorage) {
    //   loadStateFromPrefs().then((state) {
    //     store.dispatch(new LoadStateFromStorage(state));
    //   });
    // }
    if (action is ClearSettings) {
      clearSettings();
    }
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
}

void clearSettings() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.remove(APP_STATE_KEY);
}

List<Person> createAdditionalPeople() {
  final people = new List<Person>();
  for (var i = 11; i < 16; i++) {
    people.add(new Person(i));
  }
  return people;
}

final additionaPeopleList = createAdditionalPeople();

fetchPeople(startingIndex, dispatch) async {
  // Fetch 100 people
  var res = await http.get('https://jsonplaceholder.typicode.com/posts/1');
  print("Fetched More");
  var parsed = json.decode(res.body);
  print(parsed);

  // parse them into a list of people

  // send them into the state
  dispatch(new AddPeople(additionaPeopleList));
}
