import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../models/app_state_model.dart';
import '../widgets/card_list.dart';
import '../list_modes.dart';
import '../actions/actions.dart';

class Meet extends StatelessWidget {
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Map>(
      converter: (store) {
        return {"remember": () => store.dispatch(Shuffle())};
      },
      builder: (context, props) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Meet'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              new Expanded(child: CardList(ListModes.Meet)),
              renderButton(context, props["remember"]),
            ],
          ),
        );
      },
    );
  }

  renderButton(context, remember) {
    return Container(
        padding: EdgeInsets.all(20.0),
        margin: EdgeInsets.all(20.0),
        child: SizedBox(
          width: double.infinity,
          child: RaisedButton(
            color: Colors.blue,
            child: Text(
              'Test Memory',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              remember();
              Navigator.pushReplacementNamed(context, '/remember');
            },
          ),
        ));
  }
}
