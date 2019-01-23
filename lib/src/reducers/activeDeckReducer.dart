import 'package:redux/redux.dart';
import '../actions/actions.dart';

final activeDeckReducer = combineReducers<List<num>>([
  TypedReducer<List<num>, ChangeActiveDeck>(_changeActiveDeck),
]);

List<num> _changeActiveDeck(List<num> state, action) {
  return action.activeDeck;
}
