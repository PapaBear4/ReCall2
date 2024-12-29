import '../contact/models/contact.dart';

class ContactRepository {
  Future<List<Contact>> getContacts() async {
    List<Contact> dummyContacts = [
      Contact(
        id: 1,
        firstName: 'John',
        lastName: 'Smith',
        birthday: DateTime(1996, 5, 31),
        importance: ContactImportance.Low,
      ),
      Contact(
        id: 2,
        firstName: 'Sarah',
        lastName: 'Connor',
        birthday: DateTime(1985, 8, 12),
        importance: ContactImportance.Medium,
      ),
      Contact(
        id: 3,
        firstName: 'James',
        lastName: 'Bond',
        birthday: DateTime(1962, 3, 24),
        importance: ContactImportance.Low,
      ),
      Contact(
        id: 4,
        firstName: 'Ellen',
        lastName: 'Ripley',
        birthday: DateTime(1979, 11, 5),
        importance: ContactImportance.High,
      ),
      Contact(
        id: 5,
        firstName: 'Marty',
        lastName: 'McFly',
        birthday: DateTime(1968, 6, 9),
        importance: ContactImportance.Medium,
      ),
    ];

    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay

    print("Contacts from getContacts(): $dummyContacts"); // Print to console
    return dummyContacts;
  }
}