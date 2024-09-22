// Suggested code may be subject to a license. Learn more: ~LicenseLog:2496629239.
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ReCall2/person/bloc/person_bloc.dart';
import 'package:ReCall2/person/models/models.dart';

// ... import your person_bloc.dart and person.dart files

class PersonList extends StatelessWidget {
  const PersonList({super.key});

    final List<Person> dummyPersons = [
    Person(id: 1, firstName: 'Alice', lastName: 'Smith', birthday: DateTime(1990, 5, 15)),
    Person(id: 2, firstName: 'Bob', lastName: 'Johnson', birthday: DateTime(1985, 10, 22)),
    Person(id: 3, firstName: 'Charlie', lastName: 'Brown', birthday: DateTime(1998, 3, 8)),
  ];


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PersonBloc()..add(const LoadPerson(1)), // Fetch person with ID 1
      child: BlocBuilder<PersonBloc, PersonState>(
        builder: (context, state) {
          if (state is PersonLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is PersonLoaded) {
            return ListView.builder(
              itemCount: 1, // Replace with actual list of persons
              itemBuilder: (context, index) {
                // Replace with actual person data
                final person = state.person; 
                return ListTile(
                  title: Text(person.firstName),
                  subtitle: Text(person.lastName),
                );
              },
            );
          }
          if (state is PersonError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink(); // Handle other states if needed
        },
      ),
    );
  }
}
