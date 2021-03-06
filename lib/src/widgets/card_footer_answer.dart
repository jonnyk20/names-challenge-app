import 'package:flutter/material.dart';
import '../models/person_model.dart';
import '../models/app_state_model.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../actions/actions.dart';

class CardFooterAnswer extends StatelessWidget {
  final Person person;

  CardFooterAnswer(this.person);
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, OnStatusChanged>(converter: (store) {
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

enum CardStatus { Testing, Answering, Answered }

class CardFooterAnswerWidgetState extends State<CardFooterAnswerWidget> {
  Person person;
  OnStatusChanged callback;
  CardStatus cardStatus = CardStatus.Testing;

  CardFooterAnswerWidgetState(this.person, this.callback);

  Widget build(BuildContext context) {
    return StoreConnector<AppState, OnStatusChanged>(converter: (store) {
      return (person, status) => store.dispatch(ChangeStatus(person, status));
    }, builder: (context, callback) {
      return Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 8.0),
        ),
        cardStatus != CardStatus.Testing ? Text(person.name) : Container(),
        cardStatus == CardStatus.Testing ? renderShowButton() : Container(),
        cardStatus == CardStatus.Answering
            ? renderAnswerButtons(callback)
            : Container(),
      ]);
    });
  }

  toggleCardSstatus(CardStatus status) {
    setState(() {
      cardStatus = status;
    });
  }

  renderShowButton() {
    return RaisedButton(
      child: Text('Show Name'),
      onPressed: () {
        toggleCardSstatus(CardStatus.Answering);
      },
    );
  }

  renderAnswerButtons(callback) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        RaisedButton(
          child: Text('Correct'),
          onPressed: () {
            callback(person, PersonStatuses.Remembered);
            setState(() {
              toggleCardSstatus(CardStatus.Answered);
            });
          },
        ),
        RaisedButton(
          child: Text('Incorrect'),
          onPressed: () {
            callback(person, PersonStatuses.Forgotten);
            setState(() {
              toggleCardSstatus(CardStatus.Answered);
            });
          },
        ),
      ],
    );
  }
}

typedef OnStatusChanged = Function(Person person, PersonStatuses status);
