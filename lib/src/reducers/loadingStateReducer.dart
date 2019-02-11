import 'package:redux/redux.dart';
import '../actions/actions.dart';

final loadingStateReducer = combineReducers<bool>([
  TypedReducer<bool, ChangeLoadingState>(_changeLoadingState),
]);

bool _changeLoadingState(bool state, action) {
  return action.isLoading;
}
