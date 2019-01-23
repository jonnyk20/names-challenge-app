import 'package:redux/redux.dart';
import '../actions/actions.dart';

final listSizeReducer = combineReducers<int>([
  TypedReducer<int, ChangeListSize>(_changeListSize),
]);

int _changeListSize(int state, action) {
  return action.listSize;
}
