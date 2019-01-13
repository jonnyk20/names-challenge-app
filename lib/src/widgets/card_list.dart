import 'package:flutter/material.dart';
import '../models/person_model.dart';
import 'card_footer.dart';

class CardList extends StatelessWidget {
  final List<Person> people;

  CardList(this.people);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: people.length,
      itemBuilder: (context, int index) {
        return renderCard(people[index]);
      },
    );
  }

  Widget renderCard(Person person) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Padding(
            child: Image.network(person.imageUrl),
            padding: EdgeInsets.only(bottom: 8.0),
          ),
          Text(person.name),
          CardFooter(person.id),
        ],
      ),
    );
  }
}
