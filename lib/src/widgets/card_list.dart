import 'package:flutter/material.dart';
import '../models/person_model.dart';
import '../models/app_state_model.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'card_footer_answer.dart';
import '../list_modes.dart';

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
                return renderCard(person);
              });
        });
  }

  Widget renderCard(Person person) {
    MaterialColor color;
    switch (person.status) {
      case PersonStatuses.Forgotten:
        color = Colors.red;
        break;
      case PersonStatuses.Remembered:
        color = Colors.green;
        break;
      default:
        color = Colors.grey;
    }
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: color),
      ),
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        bottom: listMode == ListModes.Remember ? 20.0 : 0.0,
        top: listMode == ListModes.Meet ? 20.0 : 0.0,
      ),
      child: Column(
        children: <Widget>[
          Padding(
            child: Image.network(person.imageUrl),
            padding: EdgeInsets.only(bottom: 8.0),
          ),
          renderFooter(person),
        ],
      ),
    );
  }

  renderFooter(Person person) {
    // you can adjust this values according to your accuracy requirements
    switch (listMode) {
      case ListModes.Meet:
        // do something
        return new Container(
          child: Text(person.name),
          padding: EdgeInsets.only(top: 10.0),
        );
      case ListModes.Remember:
        // do something else
        return CardFooterAnswer(person);
    }
  }
}
