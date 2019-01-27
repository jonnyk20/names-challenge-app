import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../models/app_state_model.dart';
import '../actions/actions.dart';

class ResetSettings extends StatelessWidget {
  Widget build(context) {
    return StoreConnector<AppState, Function>(
        converter: (store) => store.dispatch,
        builder: (context, dispatch) => Container(
              child: RaisedButton(
                child: Text('Reset All App History'),
                onPressed: () {
                  dispatch(ClearSettings());
                },
              ),
            ));
  }
}
