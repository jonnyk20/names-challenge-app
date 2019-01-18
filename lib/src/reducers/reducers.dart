import '../models/person_model.dart';
import '../models/app_state_model.dart';
import '../models/deck_model.dart';
import '../actions/actions.dart';

AppState appReducers(AppState state, dynamic action) {
  if (action is ChangeStatus) {
    return changeStatus(state, action);
  } else if (action is Meet) {
    return meet(state);
  }
  //  else if (action is ToggleItemStateAction) {
  //   return toggleItemState(state, action);
  // }
  return state;
}

AppState meet(AppState state) {
  var activeList = state.people.map((person) => person.id).toList();
  return new AppState(state.people, new Deck(activeList));
}

AppState changeStatus(AppState state, action) {
  var updatedPeople = List<Person>.from(state.people.map((Person person) {
    person.status =
        (person.id == action.person.id) ? action.status : person.status;
    return person;
  }));
  return new AppState(updatedPeople, state.activeDeck);
}

// List<CartItem> addItem(List<CartItem> items, AddItemAction action) {
//   return List.from(items)..add(action.item);
// }
