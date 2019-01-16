import 'package:flutter/material.dart';
import '../models/person_model.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../actions/index.dart';

class CardFooterAnswer extends StatelessWidget {
  final Person person;

  CardFooterAnswer(this.person);
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<List<Person>, OnStatusChanged>(
        converter: (store) {
      return (person, status) => store.dispatch(ChangeStatus(person, status));
    }, builder: (context, callback) {
      return new CardFooterAnswerWidget(callback, person);
    });
  }
}

class CardFooterAnswerWidget extends StatefulWidget {
  final OnStatusChanged callback;
  final Person person;

  CardFooterAnswerWidget(this.callback, this.person);

  @override
  State<StatefulWidget> createState() =>
      new CardFooterAnswerWidgetState(person, callback);
}

class CardFooterAnswerWidgetState extends State<CardFooterAnswerWidget> {
  Person person;
  OnStatusChanged callback;
  bool showName = false;
  bool showAnswerButtons = false;
  bool showShowButton = true;

  CardFooterAnswerWidgetState(this.person, this.callback);

  Widget build(BuildContext context) {
    return StoreConnector<List<Person>, OnStatusChanged>(converter: (store) {
      return (person, status) => store.dispatch(ChangeStatus(person, status));
    }, builder: (context, callback) {
      return Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 8.0),
        ),
        showName ? Text(person.name) : Container(),
        showAnswerButtons ? renderAnswerButtons(callback) : Container(),
        showShowButton ? renderShowButton() : Container(),
      ]);
    });
  }

  toggleShowName() {
    setState(() {
      showName = true;
      showAnswerButtons = true;
      showShowButton = false;
    });
  }

  renderShowButton() {
    return RaisedButton(
      child: Text('Show name'),
      onPressed: () {
        toggleShowName();
      },
    );
  }

  renderAnswerButtons(callback) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        RaisedButton(
          child: Text('Correct: ${person.id}'),
          onPressed: () {
            callback(person, PersonStatuses.Remembered);
            setState(() {
              showAnswerButtons = false;
            });
          },
        ),
        RaisedButton(
          child: Text('Incorrect: ${person.id}'),
          onPressed: () {
            callback(person, PersonStatuses.Forgotten);
            setState(() {
              showAnswerButtons = false;
            });
          },
        ),
      ],
    );
  }
}

typedef OnStatusChanged = Function(Person person, PersonStatuses status);
