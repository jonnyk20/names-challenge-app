import 'package:flutter/material.dart';
import '../models/person_model.dart';
import '../models/app_state_model.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../list_modes.dart';
import './person_card.dart';

class CardList extends StatelessWidget {
  final ListModes listMode;

  CardList(this.listMode);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        builder: (context, state) {
          var fullList = state.people;
          var activeList = state.activeDeck;
          return ListView.builder(
              itemCount: state.activeDeck.length,
              itemBuilder: (context, int index) {
                var person = fullList.firstWhere(
                    (Person person) => person.id == activeList[index]);
                return PersonCard(person, listMode);
              });
        });
  }
}
