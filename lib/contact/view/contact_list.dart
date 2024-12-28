import 'package:ReCall2/contact/bloc/contact_bloc.dart';
import 'package:ReCall2/contact/view/contact_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ReCall2/relationship/relationship.dart';

class ContactListView extends StatelessWidget {
  const ContactListView({super.key, this.relationships});

  final List<Relationship>? relationships;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactBloc, ContactState>(
      builder: (context, state) {
        if (state is ContactLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ContactLoaded) {
          return ListView.builder(
            itemCount: state.contacts.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ContactView(contact: state.contacts[index]),
                  if (relationships != null)
                    ...relationships!.map((relationship) => Text(
                          '${relationship.contact1Id} - ${relationship.relationshipType} - ${relationship.contact2Id}',
                        )),
                ],
              );
            },
          );
        } else if (state is ContactError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('Unknown state'));
        }
      },
    );
  }
}
