import 'package:flutter/material.dart';
import '../widgets/card_list.dart';
import '../list_modes.dart';
import '../widgets/stats.dart';

class Remember extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Remember'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Stats(),
          Expanded(child: CardList(ListModes.Remember)),
        ],
      ),
    );
  }
}
