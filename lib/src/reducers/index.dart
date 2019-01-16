import '../models/person_model.dart';
import '../actions/index.dart';

List<Person> appReducers(List<Person> people, dynamic action) {
  if (action is ChangeStatus) {
    return changeStatus(people, action);
  }
  //  else if (action is ToggleItemStateAction) {
  //   return toggleItemState(people, action);
  // }
  return people;
}

List<Person> changeStatus(List<Person> people, action) {
  var updatedPeople = people.map((person) {
    person.status =
        (person.id == action.person.id) ? action.status : person.status;
    return person;
  });
  return updatedPeople.toList();
}

// List<CartItem> addItem(List<CartItem> items, AddItemAction action) {
//   return List.from(items)..add(action.item);
// }
