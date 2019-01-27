import './person_model.dart';
import '../people_fixture.dart';

class AppState {
  final bool debug;
  final List<Person> people;
  final List<num> activeDeck;
  int listSize;
  final int lastIndex;
  AppState({
    this.debug = false,
    this.people = const [],
    this.activeDeck = const [],
    this.listSize = 10,
    this.lastIndex = 0,
  });

  AppState.fromJson(Map<String, dynamic> json)
      : debug = json['debug'] == true,
        listSize = json['listSize'],
        lastIndex = json['lastIndex'],
        activeDeck = [],
        people = peopleList;

  Map<String, dynamic> toJson() =>
      {'debug': debug, 'listSize': listSize, 'lastIndex': lastIndex};

  static var initial = AppState(people: peopleList);
  static var dev = AppState(people: peopleList, debug: true);

  String toString() {
    return 'lastIndex: $lastIndex, listSize: $listSize';
  }
}
