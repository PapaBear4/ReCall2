import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ReCall2/contact/bloc/contact_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ReCall2/utils/date_time_helper.dart';
import 'package:ReCall2/contact/view/contact_edit_screen.dart';

// This widget displays a list of contacts and allows users to interact with them.
class ContactListScreen extends StatelessWidget {
  const ContactListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold provides a basic structure for the screen.
    return Scaffold(
      // AppBar displays the title of the screen.
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      // BlocBuilder listens for changes in the ContactBloc's state and rebuilds the UI accordingly.
      body: BlocBuilder<ContactBloc, ContactState>(
        builder: (context, state) {
          print('Rebuilding ContactListScreen');
          // If the state is ContactsLoading, display a loading indicator.
          if (state is ContactsLoading) {
            return const Center(
                child:
                    CircularProgressIndicator()); // Display a loading indicator while fetching contacts.
          }
          // If the state is ContactsLoaded, display the list of contacts.
          else if (state is ContactsLoaded) {
            // Get the list of contacts from the state.
            final contacts = state.contacts;
            // Build a ListView to display the contacts.
            return ListView.builder(
              // Set the number of items in the list.
              itemCount: contacts.length,
              // Define how each item in the list should be built.
              itemBuilder: (context, index) {
                // Get the contact at the current index.
                final contact = contacts[index];
                // Build a ListTile to display the contact information.
                return ListTile(
                  // Display the contact's full name.
                  title: Text(
                    "${contact.firstName} ${contact.lastName}",
                  ), // Display the contact's full name.
                  // Display the contact's birthday in MM/dd/yyyy format.
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Birthday: ${DateFormat('MM/dd').format(contact.birthday)}'),
                      Text (
                          'Last Contacted: ${formatLastContacted(contact.lastContacted)}'),
                    ],
                  ),
                   onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ContactEditScreen(contact: contact),
                      ),
                    ),
                  trailing: ElevatedButton(
                    onPressed: () {
                      var updatedLastContacted = DateTime.now();
                      
                      if (updatedLastContacted.isBefore(contact.lastContacted ?? DateTime(1900))) {
                        // Handle future date by setting it to now and notifying user.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Last contacted date was in the future. Setting to now.'),
                          ),
                        );
                      }
                      
                      context.read<ContactBloc>().add(UpdateContact(
                              contact.copyWith(
                                lastContacted: updatedLastContacted,
                              ),
                            ),
                          );
                    },
                    child: const Text('Contacted'),
                  ),
                );
              },
            ); // Display a list of contacts.
          }
          // If the state is ContactsError, display an error message.
          else if (state is ContactsError) {
            return Center(
                child: Text(
                    'Error: ${state.message}')); // Display an error message if fetching contacts fails.
          }
          // If the state is none of the above, display a generic error message.
          else {
            return const Center(
                child: Text(
                    'Something went wrong.')); // Display a generic error message if an unexpected state occurs.
          }
        },
      ), // Display the list of contacts or loading/error indicators based on the state.
      // Add a FloatingActionButton to refresh the contact list.
      floatingActionButton: FloatingActionButton(
        // Define what happens when the button is pressed.
        onPressed: () {
          // Dispatch a FetchContacts event to the ContactBloc to refresh the list.
          context
              .read<ContactBloc>()
              .add(const FetchContacts()); // Refresh the contact list.
        },
          child:  IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.push(
                context,
              MaterialPageRoute(
                builder: (context) => const ContactEditScreen(),
                ),
              ),
          ),
        ), // Display a floating action button to refresh the contact list.
    ); // Return a Scaffold widget that displays the contact list screen.
  }
}
