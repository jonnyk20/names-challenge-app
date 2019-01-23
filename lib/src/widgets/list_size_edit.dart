import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ListSizeEdit extends StatefulWidget {
  final int listSize;
  final Function changeListSize;
  ListSizeEdit(this.listSize, this.changeListSize);
  State<ListSizeEdit> createState() {
    return ListSizeEditState(this.listSize, this.changeListSize);
  }
}

class ListSizeEditState extends State<ListSizeEdit> {
  final listSize;
  final changeListSize;

  ListSizeEditState(this.listSize, this.changeListSize);

  final myController = TextEditingController();

  void initState() {
    super.initState();
    // Start listening to changes
    myController.text = listSize.toString();
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    myController.dispose();
    super.dispose();
  }

  Widget build(context) {
    // return StoreConnector<AppState, Function>(
    //   converter: (store) {
    //     return (int newDeckSize) => store.dispatch(ChangeListSize(newDeckSize));
    //   },
    //   builder: (context, callback) => renderTextField(callback),
    return renderTextField(changeListSize);
    // );
  }

  renderTextField(callback) {
    return TextField(
      keyboardType: TextInputType.number,
      inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
      onChanged: (val) {
        if (val.isNotEmpty) {
          var listSize = int.parse(val);
          callback(listSize);
        }
      },
      // Todo: prevent 0, (JK)
      controller: myController,
    );
  }
}
