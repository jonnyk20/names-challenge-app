import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../models/app_state_model.dart';
import '../actions/actions.dart';
import './list_size_edit.dart';

class ListSettings extends StatelessWidget {
  Widget build(context) {
    return StoreConnector<AppState, Map>(
      converter: (store) {
        return {
          "listSize": store.state.listSize,
          "changelistSize": (int newDeckSize) =>
              store.dispatch(ChangeListSize(newDeckSize)),
        };
      },
      builder: (context, props) =>
          ListSizeEdit(props["listSize"], props["changelistSize"]),
    );
  }
}
