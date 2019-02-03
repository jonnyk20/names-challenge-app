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
  final listSizeController = TextEditingController();
  final lastIndexController = TextEditingController();

  void initState() {
    super.initState();
    // Start listening to changes
    listSizeController.text = '0';
    listSizeController.addListener(_restrictListSize);
    lastIndexController.text = '0';
    lastIndexController.addListener(_restrictLastIndex);
  }

  void _restrictListSize() {
    if (listSizeController.text != '' &&
        int.parse(listSizeController.text) > 100) {
      listSizeController.text = '100';
      return;
    }
  }

  void _restrictLastIndex() {
    if (lastIndexController.text != '' &&
        int.parse(lastIndexController.text) > 7999) {
      lastIndexController.text = '7999';
      return;
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    listSizeController.dispose();
    super.dispose();
  }

  Widget build(context) {
    return StoreConnector<AppState, Map>(
        converter: (store) {
          listSizeController.text = store.state.listSize.toString();
          lastIndexController.text = store.state.lastIndex.toString();
          return {
            "listSize": store.state.listSize,
            "lastIndex": store.state.lastIndex,
            "changelistSize": (int newDeckSize) =>
                store.dispatch(ChangeListSize(newDeckSize)),
            "changelastIndex": (int newLastIndex) =>
                store.dispatch(ChangeLastIndex(newLastIndex)),
            "reset": () => store.dispatch(ClearSettings()),
          };
        },
        builder: (context, props) => Column(
              children: <Widget>[
                Text('How Many People per Quiz (1-100)'),
                renderListSizeInput(props["listSize"], props["changelistSize"]),
                Text('Skip to Card Number on Next Quiz (0-7999)'),
                renderLastIndexInput(
                    props["lastIndex"], props["changelastIndex"]),
              ],
            ));
  }

  renderListSizeInput(listSize, changeListSize) {
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
      controller: listSizeController,
    );
  }

  renderLastIndexInput(lastIndex, changeLastIndex) {
    return TextField(
      keyboardType: TextInputType.number,
      inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
      onChanged: (val) {
        if (val.isNotEmpty) {
          var lastIndex = int.parse(val);
          if (lastIndex <= 7999 && lastIndex >= 0) {
            changeLastIndex(lastIndex);
          }
        }
      },
      controller: lastIndexController,
    );
  }
}
