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

class FetchContacts extends ContactEvent {
  const FetchContacts();

  @override
  List<Object> get props => []; 
}

class AddContact extends ContactEvent {
  final Contact contact;
  const AddContact(this.contact);

  @override
  List<Object> get props => [contact];
}

class UpdateContact extends ContactEvent {
  final Contact contact;
  const UpdateContact(this.contact);

  @override
  List<Object> get props => [contact];
}

class DeleteContact extends ContactEvent {
  final Contact contact;
  const DeleteContact(this.contact);

  @override 
  List<Object> get props => [contact];
}

class SelectContact extends ContactEvent {
  final Contact? contact;
  const SelectContact(this.contact);

  @override
  List<Object> get props => [contact ?? const Object()];
}

class ClearSelection extends ContactEvent {
  const ClearSelection();

  @override
  List<Object> get props => [];
}
