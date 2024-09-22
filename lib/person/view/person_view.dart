import 'package:ReCall2/person/models/models.dart';
import 'package:flutter/material.dart';

class PersonView extends StatelessWidget
 {
  final Person person;

  const PersonView({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
return ListTile(
      leading: Text(person.id.toString()), // ID on the left
      title: Center(
          child: Text(
              '${person.lastName}, ${person.firstName}')), // Last, First in center
      trailing: Text(person.birthday
          .toLocal()
          .toString()
          .split(' ')[0]), // Birthday on the right (date only)
    );  }
}
