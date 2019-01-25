import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../models/app_state_model.dart';
import '../actions/actions.dart';
import '../widgets/debug_drawer.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Map>(converter: (store) {
      return {
        'meet': () {
          var nextLastIndex = math.min(
            store.state.lastIndex + store.state.listSize,
            store.state.people.length - 1,
          );
          var activeList = store.state.people
              .sublist(store.state.lastIndex, nextLastIndex)
              .map((person) => person.id)
              .toList();
          store.dispatch(ChangeActiveDeck(activeList));
          store.dispatch(ChangeLastIndex(nextLastIndex));
        },
        'activeListExists': store.state.activeDeck.length > 0,
        'listSize': store.state.listSize
      };
    }, builder: (context, props) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Names Challenge'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 8.0),
              ),
              renderStartButton(
                  context,
                  'Learn (${props['listSize']}) New Names',
                  '/meet',
                  props['meet']),
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
        endDrawer: DebugDrawer(),
      );
    });
  }

  Widget renderSettingsButton(context, text, route) {
    return RaisedButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      child: Text(text),
    );
  }

  Widget renderStartButton(context, text, route, action) {
    return RaisedButton(
      onPressed: () {
        // Navigate back to the first screen by popping the current route
        // off the stack
        action();
        Navigator.pushNamed(context, route);
      },
      child: Text(text),
    );
  }

  Widget renderReviewButton(context, text, route) {
    return RaisedButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      child: Text(text),
    );
  }
}
