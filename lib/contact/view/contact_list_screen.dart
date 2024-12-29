import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ReCall2/contact/bloc/contact_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ReCall2/contact/models/contact.dart';

class ContactListScreen extends StatelessWidget {
  const ContactListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: BlocBuilder<ContactBloc, ContactState>(
        builder: (context, state) {
          if (state is ContactsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ContactsLoaded) {
            final contacts = state.contacts;
            return ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];
                return ListTile(
                  title: Text(contact.firstName + " " + contact.lastName),
                  subtitle: Text(
                      '${DateFormat('MM/dd/yyyy').format(contact.birthday)}'),
                  trailing: DropdownButton<ContactImportance>(
                    value: contact.importance,
                    onChanged: (newImportance) {
                      if (newImportance != null) {
                        context.read<ContactBloc>().add(
                              UpdateContact(contact.copyWith(
                                  importance: newImportance)),
                            );
                      }
                    },
                    items: ContactImportance.values.map((importance) {
                      return DropdownMenuItem<ContactImportance>(
                        value: importance,
                        child: Text(importance.toString().split('.').last),
                      );
                    }).toList(),
                  ),
                );
              },
            );
          } else if (state is ContactsError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const Center(child: Text('Something went wrong.'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ContactBloc>().add(const FetchContacts());
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}