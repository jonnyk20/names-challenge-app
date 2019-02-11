import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:redux/redux.dart';

import '../actions/actions.dart';
import '../models/app_state_model.dart';
import '../models/person_model.dart';

const String APP_STATE_KEY = "NAMES_CHALLENGE_APP_STATE";

void peopleFetchMiddleware(
  Store<AppState> store,
  action,
  NextDispatcher next,
) {
  next(action);

  if (action is UpdatePeople) {
    updatePeople(store);
  }
}

updatePeople(store) async {
  AppState state = store.state;
  if (state.lastIndex + 1 + state.listSize >= state.people.last.id) {
    store.dispatch(new ChangeLoadingState(true));
    var res = await http.get(
        'https://names-challenge.herokuapp.com/images?index=${state.lastIndex}');
    var parsed = json.decode(res.body);
    List<Person> fetchedPeople = List<Person>.from(parsed.map((personData) {
      return Person.fromJson(personData);
    }));
    store.dispatch(new AddPeople(fetchedPeople));
    store.dispatch(new ChangeLoadingState(false));
  }
}
