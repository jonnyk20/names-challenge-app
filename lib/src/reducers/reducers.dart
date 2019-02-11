import '../models/app_state_model.dart';
import '../reducers/peopleReducer.dart';
import '../reducers/activeDeckReducer.dart';
import '../reducers/listSizeReducer.dart';
import '../reducers/lastIndexReducer.dart';
import '../reducers/loadingStateReducer.dart';
import '../actions/actions.dart';

// Todo, restructure reducers to look like:
// https://github.com/brianegan/flutter_architecture_samples/blob/master/example/redux/lib/reducers/

AppState appReducers(AppState state, dynamic action) {
  if (action is LoadStateFromStorage) {
    return action.state;
  }
  if (action is ClearSettings) {
    return state.debug ? AppState.dev : AppState.initial;
  }

  return AppState(
      debug: state.debug,
      people: peopleReducer(state.people, action),
      activeDeck: activeDeckReducer(state.activeDeck, action),
      listSize: listSizeReducer(state.listSize, action),
      lastIndex: lastIndexReducer(state.lastIndex, action),
      isLoading: loadingStateReducer(state.isLoading, action));
}

// List<CartItem> addItem(List<CartItem> items, AddItemAction action) {
//   return List.from(items)..add(action.item);
// }
