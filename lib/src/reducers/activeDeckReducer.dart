import 'package:redux/redux.dart';
import '../actions/actions.dart';

final activeDeckReducer = combineReducers<List<num>>([
  TypedReducer<List<num>, ChangeActiveDeck>(_changeActiveDeck),
  TypedReducer<List<num>, Shuffle>(_shuffleDeck),
]);

List<num> _changeActiveDeck(List<num> state, action) {
  List<num> newDeck = List<num>.from(action.activeDeck);
  newDeck.shuffle();
  return newDeck;
}

List<num> _shuffleDeck(List<num> state, action) {
  List newDeck = List<num>.from(state);
  newDeck.shuffle();
  return newDeck;
}
