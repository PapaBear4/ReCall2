import 'package:equatable/equatable.dart';
import 'package:ReCall2/contact/models/contact.dart';

abstract class ContactDetailsState extends Equatable {
  const ContactDetailsState();

  @override
  List<Object> get props => [];
}

class ContactDetailsLoading extends ContactDetailsState {}

class ContactDetailsLoaded extends ContactDetailsState {
  final Contact contact;

  const ContactDetailsLoaded({required this.contact});

  @override
  List<Object> get props => [contact];
}

class ContactDetailsError extends ContactDetailsState {
  final String message;

  const ContactDetailsError({required this.message});

  @override
  List<Object> get props => [message];
}
