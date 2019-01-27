import 'package:flutter/material.dart';
import '../widgets/list_settings.dart';
import '../widgets/reset_settings.dart';

class Settings extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
            ),
            ListSettings(),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ResetSettings(),
      ),
    );
  }
}
