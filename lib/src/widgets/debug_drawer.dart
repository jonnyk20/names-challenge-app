import 'package:flutter/material.dart';
import 'package:flutter_redux_dev_tools/flutter_redux_dev_tools.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../models/app_state_model.dart';

class DebugDrawer extends StatelessWidget {
  Widget build(BuildContext context) {
    return StoreConnector<AppState, dynamic>(
        converter: (store) => store,
        builder: (context, store) {
          return store.state.debug
              ? Container(
                  width: 240.0,
                  color: Colors.white,
                  child: new ReduxDevTools(store))
              : Container();
        });
  }
}
