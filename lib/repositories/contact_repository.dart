import '../contact/models/contact.dart';
import 'dart:math';

class ContactRepository {
  Future<List<Contact>> getContacts() async {
    List<Contact> dummyContacts = [
      Contact(
        id: 1,
        firstName: 'John',
        lastName: 'Smith',
        birthday: DateTime(1996, 5, 31),
        frequency: ContactFrequency.Weekly,
        lastContacted:
            DateTime.now().subtract(Duration(days: Random().nextInt(365))),
      ),
      Contact(
        id: 2,
        firstName: 'Sarah',
        lastName: 'Connor',
        birthday: DateTime(1985, 8, 12),
        frequency: ContactFrequency.Monthly,
        lastContacted:
            DateTime.now().subtract(Duration(days: Random().nextInt(365))),
      ),
      Contact(
        id: 3,
        firstName: 'James',
        lastName: 'Bond',
        birthday: DateTime(1962, 3, 24),
        frequency: ContactFrequency.Yearly,
        lastContacted:
            DateTime.now().subtract(Duration(days: Random().nextInt(365))),
      ),
      Contact(
        id: 4,
        firstName: 'Ellen',
        lastName: 'Ripley',
        birthday: DateTime(1979, 11, 5),
        frequency: ContactFrequency.Daily,
        lastContacted:
            DateTime.now().subtract(Duration(days: Random().nextInt(365))),
      ),
      Contact(
        id: 5,
        firstName: 'Marty',
        lastName: 'McFly',
        birthday: DateTime(1968, 6, 9),
        frequency: ContactFrequency.BiWeekly,
        lastContacted:
            DateTime.now().subtract(Duration(days: Random().nextInt(365))),
      ),
      Contact(
        id: 6,
        firstName: 'Jane',
        lastName: 'Doe',
        birthday: DateTime(1980, 1, 15),
        frequency: ContactFrequency.Weekly,
        lastContacted:
            DateTime.now().subtract(Duration(days: Random().nextInt(365))),
      ),
      Contact(
        id: 7,
        firstName: 'Peter',
        lastName: 'Parker',
        birthday: DateTime(2001, 8, 10),
        frequency: ContactFrequency.Monthly,
        lastContacted:
            DateTime.now().subtract(Duration(days: Random().nextInt(365))),
      ),
      Contact(
        id: 8,
        firstName: 'Bruce',
        lastName: 'Wayne',
        birthday: DateTime(1975, 4, 29),
        frequency: ContactFrequency.Quarterly,
        lastContacted: null,
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

    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay

    print("Contacts from getContacts(): $dummyContacts"); // Print to console
    return dummyContacts;
  }
}
