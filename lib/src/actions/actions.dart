import '../models/person_model.dart';

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
