import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../models/app_state_model.dart';
import '../models/person_model.dart';

class Stats extends StatelessWidget {
  List<Person> getActiveCards(List<Person> people, List<num> activeDeck) {
    return people.where((person) => activeDeck.contains(person.id)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (context, state) {
        var activeDeck = state.activeDeck;
        var people = state.people;
        var total = activeDeck.length;
        var correct = getActiveCards(people, activeDeck)
            .where((person) => person.status == PersonStatuses.Remembered)
            .length;
        var incorrect = getActiveCards(people, activeDeck)
            .where((person) => person.status == PersonStatuses.Forgotten)
            .length;
        return Container(
          padding: EdgeInsets.all(20.0),
          child: Text(
            'Active Cards: $total   Correct: $correct   Incorrect: $incorrect',
          ),
        );
      },
    );
  }
}
