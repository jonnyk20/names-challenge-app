import 'package:flutter/material.dart';

class CardFooter extends StatelessWidget {
  int id;

  CardFooter(this.id);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        RaisedButton(
          child: Text('Correct: $id'),
          onPressed: () => {},
        ),
        RaisedButton(
          child: Text('InCorrect: $id'),
          onPressed: () => {},
        ),
      ],
    );
  }
}
