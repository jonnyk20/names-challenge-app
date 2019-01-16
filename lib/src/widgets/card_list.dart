import 'package:flutter/material.dart';
import '../models/person_model.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'card_footer_answer.dart';
import '../list_modes.dart';

class CardList extends StatelessWidget {
  final ListModes listMode;

  CardList(this.listMode);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<List<Person>, List<Person>>(
        converter: (store) => store.state,
        builder: (context, people) => ListView.builder(
              itemCount: people.length,
              itemBuilder: (context, int index) {
                return renderCard(people[index]);
              },
            ));
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
      margin: EdgeInsets.all(20.0),
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

  renderFooter(person) {
    // you can adjust this values according to your accuracy requirements
    switch (listMode) {
      case ListModes.Meet:
        // do something
        return new Container();
      case ListModes.Remember:
        // do something else
        return CardFooterAnswer(person);
    }
  }
}
