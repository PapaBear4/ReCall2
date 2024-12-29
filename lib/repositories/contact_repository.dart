import 'package:ReCall2/contact/models/contact.dart';
import 'dart:math';

class ContactRepository {
  // Dummy data for contacts.
  final List<Contact> dummyContacts = [
    Contact(
      id: 1,
      firstName: 'Bruce',
      lastName: 'Wayne',
      birthday: DateTime(1915, 4, 7),
      frequency: ContactFrequency.Weekly,
      lastContacted: null,
    ),
    Contact(
      id: 2,
      firstName: 'Peter',
      lastName: 'Parker',
      birthday: DateTime(1999, 8, 10),
      frequency: ContactFrequency.Monthly,
      lastContacted: DateTime(2023, 12, 20),
    ),
    Contact(
      id: 3,
      firstName: 'Steve',
      lastName: 'Rogers',
      birthday: DateTime(1918, 7, 4),
      frequency: ContactFrequency.Yearly,
      lastContacted: DateTime(2023, 12, 25),
    ),
    Contact(
      id: 4,
      firstName: 'Tony',
      lastName: 'Stark',
      birthday: DateTime(1970, 5, 29),
      frequency: ContactFrequency.Daily,
      lastContacted: DateTime(2023, 12, 28),
    ),
    Contact(
      id: 5,
      firstName: 'Natasha',
      lastName: 'Romanoff',
      birthday: DateTime(1984, 12, 3),
      frequency: ContactFrequency.Weekly,
      lastContacted: DateTime(2023, 12, 27),
    ),
    Contact(
      id: 6,
      firstName: 'Thor',
      lastName: 'Odinson',
      birthday: DateTime(990, 1, 1),
      frequency: ContactFrequency.Never,
      lastContacted: DateTime(2023, 12, 15),
    ),
    Contact(
      id: 7,
      firstName: 'Wade',
      lastName: 'Wilson',
      birthday: DateTime(1973, 3, 1),
      frequency: ContactFrequency.Monthly,
      lastContacted: DateTime(2023, 12, 10),
    ),
    Contact(
      id: 8,
      firstName: 'Logan',
      lastName: 'Howlett',
      birthday: DateTime(1880, 1, 1),
      frequency: ContactFrequency.Yearly,
      lastContacted: DateTime(2023, 12, 5),
    ),
    Contact(
      id: 9,
      firstName: 'Diana',
      lastName: 'Prince',
      birthday: DateTime(1990, 7, 20),
      frequency: ContactFrequency.Never,
      lastContacted: null,
    ),
    Contact(
      id: 10,
      firstName: 'Clark',
      lastName: 'Kent',
      birthday: DateTime(1983, 2, 18),
      frequency: ContactFrequency.Yearly,
      lastContacted: null,
    ),
  ];

  Future<List<Contact>> getContacts() async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay
    print("Contacts from getContacts(): $dummyContacts"); // Print to console
    return dummyContacts;
  }

  Future<void> createContact(Contact contact) async {
    // Find the highest existing ID
      final highestId = dummyContacts.isNotEmpty
          ? dummyContacts.map((c) => c.id).reduce(max)
          : 0;

      // Generate a new unique ID
      final newId = highestId + 1;

    dummyContacts.add(contact.copyWith(id: newId));
  }
    Future<void> deleteContact(int id) async {
        dummyContacts.removeWhere((contact) => contact.id == id);
  }
  
  Future<void> updateContact(Contact updatedContact) async {
    final index = dummyContacts.indexWhere((contact) => contact.id == updatedContact.id);
    if (index != -1) {
      dummyContacts[index] = updatedContact;
    }
  }

}
