import 'package:ReCall2/person/bloc/person_bloc.dart';
import 'package:ReCall2/person/view/person_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ReCall2/relationship/relationship.dart';

class PersonListView extends StatelessWidget {
  const PersonListView({super.key, this.relationships});

  final List<Relationship>? relationships;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonBloc, PersonState>(
      builder: (context, state) {
        if (state is PersonLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PersonLoaded) {
          return ListView.builder(
            itemCount: state.persons.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  PersonView(person: state.persons[index]),
                  if (relationships != null)
                    ...relationships!.map((relationship) => Text(
                          '${relationship.person1Id} - ${relationship.relationshipType} - ${relationship.person2Id}',
                        )),
                ],
              );
            },
          );
        } else if (state is PersonError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('Unknown state'));
        }
      },
    );
  }
}
