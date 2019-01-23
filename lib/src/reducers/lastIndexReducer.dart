import 'package:redux/redux.dart';
import '../actions/actions.dart';

final lastIndexReducer = combineReducers<int>([
  TypedReducer<int, ChangeLastIndex>(_changeLastIndex),
]);

int _changeLastIndex(int state, action) {
  return action.lastIndex;
}
