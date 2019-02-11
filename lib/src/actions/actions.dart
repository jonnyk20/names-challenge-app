import '../models/person_model.dart';
import '../models/app_state_model.dart';

class ChangeStatus {
  final Person person;
  final PersonStatuses status;

  ChangeStatus(this.person, this.status);
}

class ChangeActiveDeck {
  final List<num> activeDeck;
  ChangeActiveDeck(this.activeDeck);
}

class ChangeListSize {
  final int listSize;
  ChangeListSize(this.listSize);
}

class ChangeLastIndex {
  final int lastIndex;
  ChangeLastIndex(this.lastIndex);
}

class RetrieveStateFromStorage {}

class LoadStateFromStorage {
  final AppState state;
  LoadStateFromStorage(this.state);
}

class ClearSettings {}

class AddPeople {
  final List<Person> people;
  AddPeople(this.people);
}

class UpdatePeople {}

class ChangeLoadingState {
  final bool isLoading;
  ChangeLoadingState(this.isLoading);
}

class Shuffle {}
