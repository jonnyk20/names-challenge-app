import './actions/actions.dart';
import './models/app_state_model.dart';

void meet(store) async {
  AppState state = store.state;
  int nextAvailableCardIndex =
      state.people.lastIndexWhere((person) => person.id == state.lastIndex);
  int lastAvailableCardIndex = state.people.length - 1;
  bool isListShort =
      nextAvailableCardIndex + state.listSize > lastAvailableCardIndex;

  int listEnd = isListShort
      ? lastAvailableCardIndex
      : nextAvailableCardIndex + state.listSize;
  var activeList = state.people
      .sublist(nextAvailableCardIndex, listEnd)
      .map((person) => person.id)
      .toList();
  store.dispatch(ChangeActiveDeck(activeList));
  store.dispatch(ChangeLastIndex(state.lastIndex + state.listSize));
}
