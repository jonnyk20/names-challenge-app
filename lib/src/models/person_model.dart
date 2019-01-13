class Person {
  int id;
  String imageUrl;
  String name;

  Person(int id) {
    this.id = id;
    this.imageUrl = 'https://randomuser.me/api/portraits/men/$id.jpg';
    this.name = 'Person $id';
  }
}
