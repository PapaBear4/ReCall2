//import 'package:ReCall2/contact/bloc/contact_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ReCall2/contact/view/contact_list.dart';
import 'package:ReCall2/relationship/relationship.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RelationshipBloc(), // Create RelationshipBloc instance
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Relationships'),
        ),
        body: BlocBuilder<RelationshipBloc, RelationshipState>(
          builder: (context, state) {
            if (state is RelationshipLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is RelationshipLoaded) {
              return ContactListView(
                  relationships: state
                      .relationships); // Pass relationships to the list view
            } else if (state is RelationshipError) {
              return Center(child: Text(state.message));
            }
            // ... add handlers for other states
            return Container(); // Or a default widget
          },
        ),
      ),
    );
  }
}