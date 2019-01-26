import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../models/app_state_model.dart';
import '../actions/actions.dart';
import 'package:flutter/services.dart';

class ListSettings extends StatefulWidget {
  @override
  State<ListSettings> createState() {
    return ListSettingsState();
  }
}

class ListSettingsState extends State<ListSettings> {
  final myController = TextEditingController();

  void initState() {
    super.initState();
    // Start listening to changes
    myController.text = '0';
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    myController.dispose();
    super.dispose();
  }

  Widget build(context) {
    return StoreConnector<AppState, Map>(
        converter: (store) {
          myController.text = store.state.listSize.toString();
          return {
            "listSize": store.state.listSize,
            "changelistSize": (int newDeckSize) =>
                store.dispatch(ChangeListSize(newDeckSize)),
            "reset": () => store.dispatch(ClearSettings()),
          };
        },
        builder: (context, props) => Column(
              children: <Widget>[
                renderTextField(props["listSize"], props["changelistSize"]),
                RaisedButton(
                  child: Text('Reset'),
                  onPressed: props["reset"],
                )
              ],
            ));
  }

  renderTextField(listSize, changeListSize) {
    return TextField(
      keyboardType: TextInputType.number,
      inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
      onChanged: (val) {
        if (val.isNotEmpty) {
          var listSize = int.parse(val);
          changeListSize(listSize);
        }
      },
      // Todo: prevent 0, (JK)
      controller: myController,
    );
  }
}
