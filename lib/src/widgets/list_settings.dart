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
    myController.addListener(_restictInput);
  }

  void _restictInput() {
    if (myController.text != '' && int.parse(myController.text) > 100) {
      myController.text = '100';
      return;
    }
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
                Text('How Many People per Quiz (1-100)'),
                renderTextField(props["listSize"], props["changelistSize"]),
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
          if (listSize <= 100 && listSize >= 0) {
            changeListSize(listSize);
          }
        }
      },
      controller: myController,
    );
  }
}
