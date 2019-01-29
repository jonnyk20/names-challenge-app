import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Person {
  int id;
  String imageUrl;
  String name;
  PersonStatuses status;
  CachedNetworkImage image;

  Person(int id) {
    this.id = id;
    this.imageUrl = 'https://randomuser.me/api/portraits/men/$id.jpg';
    this.name = 'Person $id';
    this.status = PersonStatuses.New;
    this.image = CachedNetworkImage(
      placeholder: CircularProgressIndicator(),
      imageUrl: 'https://randomuser.me/api/portraits/men/$id.jpg',
    );
  }
  Person.fromJson(dynamic json)
      : id = json['id'],
        imageUrl = json['details']['src']['medium'],
        name = json['name'],
        status = PersonStatuses.New,
        image = CachedNetworkImage(
          placeholder: CircularProgressIndicator(),
          imageUrl: json['details']['src']['medium'],
        );
}

enum PersonStatuses { New, Forgotten, Remembered }
