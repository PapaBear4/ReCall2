import 'package:ReCall2/contact/models/models.dart';
import 'package:flutter/material.dart';

class ContactView extends StatelessWidget
 {
  final Contact contact;

  const ContactView({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
return ListTile(
      leading: Text(contact.id.toString()), // ID on the left
      title: Center(
          child: Text(
              '${contact.lastName}, ${contact.firstName}')), // Last, First in center
      trailing: Text(contact.birthday
          .toLocal()
          .toString()
          .split(' ')[0]), // Birthday on the right (date only)
    );  }
}
