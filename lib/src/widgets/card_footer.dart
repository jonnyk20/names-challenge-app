import 'package:flutter/material.dart';
import '../models/person_model.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../actions/index.dart';

class CardFooter extends StatelessWidget {
  final Person person;

  CardFooter(this.person);
  @override
  Widget build(BuildContext context) {
    return StoreConnector<List<Person>, OnNameChanged>(converter: (store) {
      return (person) => store.dispatch(ChangeName(person));
    }, builder: (context, callback) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
            child: Text('Correct: ${person.id}'),
            onPressed: () {
              callback(person);
            },
          ),
          RaisedButton(
            child: Text('InCorrect: ${person.id}'),
            onPressed: () => {},
          ),
        ],
      );
    });
  }
}

typedef OnNameChanged = Function(Person person);
