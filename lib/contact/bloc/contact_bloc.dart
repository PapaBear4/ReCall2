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
        try {
          // Call the updateContact method of the contactRepository to update the contact.
          await contactRepository.updateContact(event.contact);
          // Call the getContacts method of the contactRepository to fetch the updated list of contacts.
          final contacts = await contactRepository.getContacts();
          // Emit the ContactsLoaded state with the updated contacts list to indicate success.
          emit(ContactsLoaded(contacts));
        } catch (e) {
          // If an error occurs during the update, emit the ContactsError state with the error message.
          emit(ContactsError(message: e.toString()));
        }        
      },
    );

    // This registers an event handler for the CreateContact event.
    // When a CreateContact event is dispatched, this handler will be executed.
    on<CreateContact>((event, emit) async {
      // Try to create a new contact in the repository.
      try {
        // Call the createContact method of the contactRepository to create the contact.
        await contactRepository.createContact(event.contact);
        // Call the getContacts method of the contactRepository to fetch the updated list of contacts.
        final contacts = await contactRepository.getContacts();
        // Emit the ContactsLoaded state with the updated contacts list to indicate success.
        emit(ContactsLoaded(contacts));
      } catch (e) {
        // If an error occurs during creation, emit the ContactsError state with the error message.
        emit(ContactsError(message: e.toString()));
      }
    });
  }
}
