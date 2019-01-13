import './models/person_model.dart';

List<Person> createPeople() {
  final people = new List<Person>();
  for (var i = 1; i < 6; i++) {
    people.add(new Person(i));
  }
  return people;
}

final peopleList = createPeople();
