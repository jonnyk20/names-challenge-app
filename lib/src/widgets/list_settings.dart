import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../models/app_state_model.dart';
import '../actions/actions.dart';

class ListSettings extends StatefulWidget {
  State<ListSettings> createState() {
    return ListSettingsState();
  }
}

class ListSettingsState extends State<ListSettings> {
  int listLength = 10;

  final myController = TextEditingController();

  void initState() {
    super.initState();
    // Start listening to changes
    myController.text = listLength.toString();
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    myController.dispose();
    super.dispose();
  }

  Widget build(context) {
    return StoreConnector<AppState, Function>(
      converter: (store) {
        return (int newDeckSize) => store.dispatch(ChangeListSize(newDeckSize));
      },
      builder: (context, callback) => renderTextField(callback),
    );
  }

  renderTextField(callback) {
    return TextField(
      keyboardType: TextInputType.number,
      inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
      onChanged: (val) {
        if (val.isNotEmpty) {
          var listLength = int.parse(val);
          print('listLength + 1: ${listLength + 1}');
          callback(listLength);
        }
      },
      // Todo: prevent 0, (JK)
      controller: myController,
    );
  }
}

// TextInputFormatter.digitsOnly
