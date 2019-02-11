import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('Loading Cards..'),
        Padding(
          padding: EdgeInsets.only(bottom: 8.0),
        ),
        CircularProgressIndicator(),
      ],
    );
  }
}
