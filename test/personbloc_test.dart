import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ReCall2/person/person.dart';

void main() {
  group('PersonBloc', () {
    blocTest<PersonBloc, PersonState>(
      'emits [PersonLoading, PersonLoaded] when LoadDummyPeople is added',
      build: () => PersonBloc(),
      act: (bloc) => bloc.add(const LoadDummyPeople(numberOfPeople: 5)),
      expect: () => [
        PersonLoading(),
        PersonLoaded(persons: [
          Person(
              id: 1,
              firstName: 'FirstName 1',
              lastName: 'LastName 1',
              birthday: DateTime.now().subtract(const Duration(days: 365 * 20))),
          Person(
              id: 2,
              firstName: 'FirstName 2',
              lastName: 'LastName 2',
              birthday: DateTime.now().subtract(const Duration(days: 365 * 21))),
          Person(
              id: 3,
              firstName: 'FirstName 3',
              lastName: 'LastName 3',
              birthday: DateTime.now().subtract(const Duration(days: 365 * 22))),
        ]),
      ]  //expect
    );
  });

    // Add more tests for other events and scenarios
}

