import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ReCall2/person/models/models.dart';
import 'package:ReCall2/person/bloc/person_bloc.dart';

// ... import your person_bloc.dart and person.dart files

class PersonDetails extends StatelessWidget {
  final Person person; 
  const PersonDetails({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Person Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('First Name: ${person.firstName}'),
            Text('Last Name: ${person.lastName}'),
            // ... display other details

            ElevatedButton(
              onPressed: () {
                // TODO: Handle update logic
                // context.read<PersonBloc>().add(UpdatePerson(updatedPerson));
              },
              child: const Text('Update'),
            ),
          ],
        ),
      ),
    );
  }
}
