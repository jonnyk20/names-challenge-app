import './person_model.dart';
import '../people_fixture.dart';

class AppState {
  final List<Person> people;
  final List<num> activeDeck;
  int listSize;
  final int lastIndex;
  AppState({
    this.people = const [],
    this.activeDeck = const [],
    this.listSize = 10,
    this.lastIndex = 0,
  });

  static var initial = AppState(people: peopleList);
}
