part of 'contact_bloc.dart';

abstract class ContactState extends Equatable {
  const ContactState();

  @override
  List<Object> get props => [];
}

class ContactInitial extends ContactState {
  const ContactInitial();
}

class ContactLoading extends ContactState {}

class ContactLoaded extends ContactState {
  final List<Contact> contacts;
  const ContactLoaded({required this.contacts});

  @override
  List<Object> get props => [contacts];
}

class ContactError extends ContactState {
  final String message; // Add message parameter
  const ContactError(this.message); // Update constructor

  @override
  List<Object> get props => [message];
}

class ContactsLoading extends ContactState {}

class ContactsLoaded extends ContactState {
  final List<Contact> contacts;

  const ContactsLoaded(this.contacts);

  @override
  List<Object> get props => [contacts];
}

class ContactsError extends ContactState {
  final String? message;

  const ContactsError({this.message});

  @override
  List<Object> get props => [message ?? ""];
}