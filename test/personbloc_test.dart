import 'package:ReCall2/repositories/contact_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ReCall2/contact/contact.dart';

void main() {
  group('ContactBloc', () {
    blocTest<ContactBloc, ContactState>(
      'emits [ContactLoading, ContactLoaded] when LoadDummyContacts is added',
      build: () => ContactBloc(contactRepository: ContactRepository()),
      act: (bloc) => bloc.add(const LoadDummyContacts(numberOfContacts: 5)),
      expect: () => [
        ContactLoading(),
        ContactLoaded(contacts: [
          Contact(
              id: 1,
              firstName: 'FirstName 1',
              lastName: 'LastName 1',
              birthday: DateTime.now().subtract(const Duration(days: 365 * 20)),
              importance: ContactImportance.High,),
              
          Contact(
              id: 2,
              firstName: 'FirstName 2',
              lastName: 'LastName 2',
              birthday: DateTime.now().subtract(const Duration(days: 365 * 21)),
              importance: ContactImportance.High,),
              
          Contact(
              id: 3,
              firstName: 'FirstName 3',
              lastName: 'LastName 3',
              birthday: DateTime.now().subtract(const Duration(days: 365 * 22)),
              importance: ContactImportance.High,),
        ]),
      ]  //expect
    );
  });

    // Add more tests for other events and scenarios
}

