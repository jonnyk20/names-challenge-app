import 'package:flutter/material.dart';
import '../widgets/card_list.dart';
import '../list_modes.dart';
import '../widgets/debug_drawer.dart';

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
            new Expanded(child: CardList(ListModes.Meet)),
            renderButton(context),
          ],
        ),
        endDrawer: DebugDrawer());
  }

  renderButton(context) {
    return Container(
        padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.all(20.0),
        child: SizedBox(
          width: double.infinity,
          // height: double.infinity,
          child: RaisedButton(
            child: Text('Test Memory'),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/remember');
            },
          ),
        ));
  }
}
