import './person_model.dart';
import './deck_model.dart';
import '../people_fixture.dart';

class AppState {
  final List<Person> people;
  final Deck activeDeck;
  int listLength = 10;
  AppState(this.people, this.activeDeck);
  updateListlength(int newLength) {
    listLength = newLength;
  }

  static var initial = AppState(peopleList, new Deck(new List<num>()));
}
