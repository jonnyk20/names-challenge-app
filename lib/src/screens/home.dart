import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:connectivity/connectivity.dart';
import '../models/app_state_model.dart';
import '../people_service.dart';
import '../widgets/loading.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Map>(converter: (store) {
      return {
        'meet': () {
          meet(store);
        },
        'activeListExists': store.state.activeDeck.length > 0,
        'listSize': store.state.listSize,
        'isLoading': store.state.isLoading,
      };
    }, builder: (context, props) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Names Challenge'),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              props['isLoading'] ? LoadingWidget() : Container(),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
              ),
              renderStartButton(
                context,
                'Learn (${props['listSize']}) New Names',
                '/meet',
                props['meet'],
                props['isLoading'],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
              ),
              props['activeListExists']
                  ? renderReviewButton(
                      context, 'Return to Current Quiz', '/remember')
                  : Container(),
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
              ),
              renderSettingsButton(context, 'Settings', '/settings'),
            ],
          ),
        ),
      );
    });
  }

  // user defined function
  void _checkConnectivity(context, Function action) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: new Text("No Connection Detected"),
            content: new Text("You need an internet connection to see images"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              new FlatButton(
                child: new Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return;
    }
    action();
    // flutter defined function
  }

  Widget renderSettingsButton(context, text, route) {
    return RaisedButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      child: Text(text),
    );
  }

  Widget renderStartButton(context, text, route, action, isLoading) {
    return RaisedButton(
      color: Colors.blue,
      onPressed: isLoading
          ? null
          : () {
              // Navigate back to the first screen by popping the current route
              // off the stack
              _checkConnectivity(context, () {
                action();
                Navigator.pushNamed(context, route);
              });
            },
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  Widget renderReviewButton(context, text, route) {
    return RaisedButton(
      color: Colors.blue,
      onPressed: () {
        _checkConnectivity(context, () {
          Navigator.pushNamed(context, route);
        });
      },
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
