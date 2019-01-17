import '../models/person_model.dart';

class ChangeStatus {
  final Person person;
  final PersonStatuses status;

  ChangeStatus(this.person, this.status);
}
