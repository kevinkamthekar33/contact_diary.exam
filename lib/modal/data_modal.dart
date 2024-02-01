import 'dart:io';

class Contact {
  int id;
  String name;
  String number;
  File? image;

  Contact({
    required this.id,
    required this.name,
    required this.number,
    this.image,
  });

  factory Contact.fromMap({required Map data}) {
    return Contact(
      id: data['id'],
      name: data['name'],
      number: data['number'],
      image: data['image'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'number': number,
      'image': image,
    };
  }
}
