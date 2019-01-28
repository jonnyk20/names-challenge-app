class Person {
  int id;
  String imageUrl;
  String name;
  PersonStatuses status;

  Person(int id) {
    this.id = id;
    this.imageUrl = 'https://randomuser.me/api/portraits/men/$id.jpg';
    this.name = 'Person $id';
    this.status = PersonStatuses.New;
  }
  Person.fromJson(dynamic json)
      : id = json['id'],
        imageUrl = json['details']['src']['medium'],
        name = json['name'],
        status = PersonStatuses.New;
}

enum PersonStatuses { New, Forgotten, Remembered }
