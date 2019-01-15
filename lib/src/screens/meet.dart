import 'package:flutter/material.dart';
import '../widgets/card_list.dart';
import '../list_modes.dart';

class Meet extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meet'),
      ),
      body: Center(
        child: CardList(ListModes.Meet),
      ),
    );
  }
}
