import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Names Challenge'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            renderButton(context, 'Learn Names', '/meet'),
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
            ),
            renderButton(context, 'Remember Names', '/remember'),
          ],
        ),
      ),
    );
  }

  renderButton(context, text, route) {
    return RaisedButton(
      onPressed: () {
        // Navigate back to the first screen by popping the current route
        // off the stack
        Navigator.pushNamed(context, route);
      },
      child: Text(text),
    );
  }
}
