import 'package:flutter/material.dart';
import '../widgets/card_list.dart';
import '../list_modes.dart';
import '../widgets/debug_drawer.dart';

class Remember extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Remember'),
      ),
      body: Center(
        child: CardList(ListModes.Remember),
      ),
      endDrawer: DebugDrawer(),
    );
  }
}
