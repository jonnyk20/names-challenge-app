import 'package:redux/redux.dart';
import '../actions/actions.dart';
import '../models/person_model.dart';

final peopleReducer = combineReducers<List<Person>>([
  TypedReducer<List<Person>, ChangeStatus>(_changeStatus),
  TypedReducer<List<Person>, AddPeople>(_addPeople),
]);

List<Person> _changeStatus(List<Person> state, action) {
  var updatedPeople = List<Person>.from(state.map((Person person) {
    person.status =
        (person.id == action.person.id) ? action.status : person.status;
    return person;
  }));
  return updatedPeople;
}

List<Person> _addPeople(List<Person> state, action) {
  var updatedPeople = List<Person>.from(state)..addAll(action.people);
  return updatedPeople;
}
