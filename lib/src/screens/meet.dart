import 'package:flutter/material.dart';
import '../widgets/card_list.dart';
import '../list_modes.dart';

class Meet extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meet'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          new Container(
              padding: EdgeInsets.all(20.0),
              margin: EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                // height: double.infinity,
                child: new RaisedButton(
                  child: Text('Test Memory'),
                  onPressed: () {},
                ),
              )),
          new Expanded(child: CardList(ListModes.Meet)),
        ],
      ),
    );
  }
}
