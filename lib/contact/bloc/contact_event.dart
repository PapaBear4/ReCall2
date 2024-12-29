part of 'contact_bloc.dart';

// This abstract class defines the base for all events related to contacts.
abstract class ContactEvent extends Equatable {
  // Constructor for the ContactEvent class.
  const ContactEvent();

  // This method is required by Equatable and is used to compare events for equality.
  // It returns an empty list by default, meaning that all ContactEvents are considered equal.
  @override
  List<Object> get props => [];
}

// This event is used to load a single contact by its ID.
class LoadContact extends ContactEvent {
  // The ID of the contact to be loaded.
  final int id; 

  // Constructor for the LoadContact event.
  const LoadContact(this.id); 

  // This method overrides the props method of the Equatable class.
  // It returns a list containing the ID of the contact, which is used for comparison.
  @override
  List<Object> get props => [id]; 
}

// This event is used to update an existing contact.
class UpdateContact extends ContactEvent {
  // The contact object to be updated.
  final Contact contact; 

  // Constructor for the UpdateContact event.
  const UpdateContact(this.contact); 

  // This method overrides the props method of the Equatable class.
  // It returns a list containing the contact object, which is used for comparison.
  @override
  List<Object> get props => [contact]; 
}
// This event is used to delete a contact by its ID.
class DeleteContact extends ContactEvent {
  // The ID of the contact to be deleted.
  final int id; 

  // Constructor for the DeleteContact event.
  const DeleteContact(this.id); 

  // This method overrides the props method of the Equatable class.
  // It returns a list containing the ID of the contact, which is used for comparison.

  @override
  List<Object> get props => [id]; 
}

// This event is used to fetch all contacts from a data source.
class FetchContacts extends ContactEvent {
  // Constructor for the FetchContacts event.
  const FetchContacts();

  // This method overrides the props method of the Equatable class.
  // It returns an empty list since there are no properties to compare for equality.
  @override
  List<Object> get props => []; 
}

// This event is used to load a specified number of dummy contacts.
class LoadDummyContacts extends ContactEvent {
  // The number of dummy contacts to be loaded.
  final int numberOfContacts; 

  // Constructor for the LoadDummyContacts event.
  const LoadDummyContacts({required this.numberOfContacts}); 

  // This method overrides the props method of the Equatable class.
  // It returns a list containing the number of contacts, which is used for comparison.
  @override
  List<Object> get props => [numberOfContacts]; 
}

// This event is used to create a new contact.
class CreateContact extends ContactEvent {
  // The contact object to be created.
  final Contact contact; 

  // Constructor for the CreateContact event.
  const CreateContact(this.contact);

  // This method overrides the props method of the Equatable class.
  // It returns a list containing the contact object, which is used for comparison.

  @override
  List<Object> get props => [contact]; 
}
