import 'package:flutter/material.dart';
import '../models/person_model.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../actions/index.dart';

class CardFooterAnswer extends StatelessWidget {
  final Person person;

  CardFooterAnswer(this.person);
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<List<Person>, OnNameChanged>(converter: (store) {
      return (person) => store.dispatch(ChangeName(person));
    }, builder: (context, callback) {
      return new CardFooterAnswerWidget(callback, person);
    });
  }
}

class CardFooterAnswerWidget extends StatefulWidget {
  final OnNameChanged callback;
  final Person person;

  CardFooterAnswerWidget(this.callback, this.person);

  @override
  State<StatefulWidget> createState() =>
      new CardFooterAnswerWidgetState(person, callback, false);
}

class CardFooterAnswerWidgetState extends State<CardFooterAnswerWidget> {
  Person person;
  OnNameChanged callback;
  bool showName;

  CardFooterAnswerWidgetState(this.person, this.callback, this.showName);

  Widget build(BuildContext context) {
    return StoreConnector<List<Person>, OnNameChanged>(converter: (store) {
      return (person) => store.dispatch(ChangeName(person));
    }, builder: (context, callback) {
      return Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 8.0),
        ),
        showName ? renderAnswerButtons(callback) : renderShowButton(),
      ]);
    });
  }

  toggkeShowName() {
    setState(() {
      showName = true;
    });
  }

  renderShowButton() {
    return RaisedButton(
      child: Text('Show name'),
      onPressed: () {
        toggkeShowName();
      },
    );
  }

  renderAnswerButtons(callback) {
    return Column(
      children: <Widget>[
        Text(person.name),
        Row(
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
        )
      ],
    );
  }
}

typedef OnNameChanged = Function(Person person);
