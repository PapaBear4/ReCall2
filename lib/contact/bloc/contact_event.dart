part of 'contact_bloc.dart';

abstract class ContactEvent extends Equatable {
  const ContactEvent();

  @override
  List<Object> get props => [];
}

class LoadContact extends ContactEvent {
  final int id; 
  const LoadContact(this.id);

  @override
  List<Object> get props => [id];
}

class UpdateContact extends ContactEvent {
  final Contact contact;
  const UpdateContact(this.contact);

  @override
  List<Object> get props => [contact]; 
}

class CreateContact extends ContactEvent {
  final Contact contact; // The new contact to be created 
  const CreateContact(this.contact);

  @override
  List<Object> get props => [contact];
}

class DeleteContact extends ContactEvent {
  final int id; // The ID of the contact to be deleted
  const DeleteContact(this.id);

  @override
  List<Object> get props => [id];
}

class LoadContacts extends ContactEvent {
  // No need for parameters since you're loading all contacts

  const LoadContacts();

  @override
  List<Object> get props => []; // No properties to compare for equality
}

class LoadDummyContacts extends ContactEvent {
  final int numberOfContacts; 

  const LoadDummyContacts({required this.numberOfContacts});

  @override
  List<Object> get props => [numberOfContacts];
}





