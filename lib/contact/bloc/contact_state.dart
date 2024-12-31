part of 'contact_bloc.dart';

// This abstract class defines the base structure for all possible states
// that the ContactBloc can be in.
abstract class ContactState extends Equatable {
  // Constructor for the ContactState base class.
  const ContactState();

  // This getter is required by Equatable and is used to compare states
  // for equality. It returns an empty list by default, indicating that
  // the base ContactState has no properties that should be used for comparison.
  @override
  List<Object> get props => [];
}

// This state represents the initial state of the ContactBloc before
// any events have been processed.
class ContactInitial extends ContactState {
  // Constructor for the ContactInitial state.
  const ContactInitial();
}

// This state represents an error that occurred during a contact operation.
class ContactError extends ContactState {
  // The error message describing the error.
  final String message;

  // Constructor for the ContactError state, requiring an error message.
  const ContactError(this.message);

  // Overrides the props getter to include the error message for comparison.
  // This ensures that two ContactError states are considered equal if
  // they have the same error message.
  @override
  List<Object> get props => [message];
}

// This state represents the bloc being in a loading state, typically
// when fetching multiple contacts.
class ContactsLoading extends ContactState {}

// This state represents the successful loading of multiple contacts.
class ContactsLoaded extends ContactState {
  // The loaded list of contacts.
  final List<Contact> contacts;
  final Contact? selectedContact;

  // Constructor for the ContactsLoaded state, requiring a list of contacts.
  const ContactsLoaded({required this.contacts, this.selectedContact});

  // Overrides the props getter to include the contacts list for comparison.
  // This ensures that two ContactsLoaded states are considered equal if
  // they have the same list of contacts.
  @override
  List<Object> get props => [contacts, selectedContact ?? const Object()];
}

// This state represents an error that occurred during a contact operation,
// typically when dealing with multiple contacts.
class ContactsError extends ContactState {
  // The error message describing the error, which can be null.
  final String? message;

  // Constructor for the ContactsError state, optionally taking an error message.
  const ContactsError({this.message});

  // Overrides the props getter to include the error message for comparison.
  // If the message is null, an empty string is used instead to ensure
  // that the props list is never null.
  @override
  List<Object> get props => [message ?? ""];
}