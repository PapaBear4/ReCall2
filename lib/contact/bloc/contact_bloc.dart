import 'package:equatable/equatable.dart';
import 'package:ReCall2/contact/models/contact.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ReCall2/repositories/contact_repository.dart';

part 'contact_event.dart';
part 'contact_state.dart';

// This class defines the ContactBloc, which manages the state of the contact data.
class ContactBloc extends Bloc<ContactEvent, ContactState> {
  // An instance of the ContactRepository, which is responsible for fetching and storing contact data.
  final ContactRepository contactRepository;

  // Constructor for the ContactBloc, which initializes the bloc with the provided ContactRepository and sets the initial state to ContactInitial.
  ContactBloc({required this.contactRepository}) : super(const ContactInitial()) {
    // This registers an event handler for the FetchContacts event.
    // When a FetchContacts event is dispatched, this handler will be executed.
    on<FetchContacts>(
      // Event handler function that takes the event and an emit function as parameters.
      (event, emit) async {
        // Emit the ContactsLoading state to indicate that the bloc is loading contacts.
        emit(ContactsLoading());
        // Try to fetch the contacts from the repository.
        try {
          // Call the getContacts method of the contactRepository to fetch the contacts.
          final contacts = await contactRepository.getContacts();
          // Emit the ContactsLoaded state with the fetched contacts to indicate that the contacts have been loaded successfully..
          emit(ContactsLoaded(contacts));
          // If an error occurs during the process, catch the error and emit the ContactsError state with the error message.
        } catch (e) {
          // Emit the ContactsError state with the error message.
          emit(ContactsError(message: e.toString()));
        }
      },
    );

    // This registers an event handler for the UpdateContact event.
    // When an UpdateContact event is dispatched, this handler will be executed.
    on<UpdateContact>(
      // Event handler function that takes the event and an emit function as parameters.
      (event, emit) async {
        // Check if the current state is ContactsLoaded.
        if (state is ContactsLoaded) {
          // If the current state is ContactsLoaded, update the contacts list with the new contact.
          final updatedContacts = (state as ContactsLoaded)
              .contacts
              .map(
                // Iterate through the existing contacts.
                (c) {
                  // If the current contact's ID matches the ID of the contact to be updated, replace it with the new contact.
                  // Otherwise, keep the existing contact.
                  return c.id == event.contact.id ? event.contact : c;
                },
              )
              // Convert the updated contacts back to a list.
              .toList();
          // Emit the ContactsLoaded state with the updated contacts list.
          emit(ContactsLoaded(updatedContacts));
        }
      },
    );
  }
}
