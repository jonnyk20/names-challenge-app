import '../models/person_model.dart';
import '../actions/index.dart';

List<Person> appReducers(List<Person> people, dynamic action) {
  if (action is ChangeName) {
    return changeName(people, action);
  }
  //  else if (action is ToggleItemStateAction) {
  //   return toggleItemState(people, action);
  // }
  return people;
}

List<Person> changeName(List<Person> people, action) {
  print('----------------');
  print(action.person);
  var updatedPeople = people.map((person) {
    person.name = (person.id == action.person.id) ? 'New Name' : person.name;
    return person;
  });
  return updatedPeople.toList();
}

// List<CartItem> addItem(List<CartItem> items, AddItemAction action) {
//   return List.from(items)..add(action.item);
// }

// List<CartItem> toggleItemState(
//     List<CartItem> items, ToggleItemStateAction action) {
//   return items
//       .map((item) => item.name == action.item.name ? action.item : item)
//       .toList();
// }
