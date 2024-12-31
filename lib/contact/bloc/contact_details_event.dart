import 'package:equatable/equatable.dart';
import '../models/contact.dart';

abstract class ContactDetailsEvent extends Equatable {}

class LoadContactDetails extends ContactDetailsEvent {
  final Contact contact;

  LoadContactDetails(this.contact);

  @override
  List<Object?> get props => [contact];
}

class UpdateContactDetails extends ContactDetailsEvent {
  final Contact contact;

  UpdateContactDetails(this.contact);

  @override
  List<Object?> get props => [contact];
}

class DeleteContactDetails extends ContactDetailsEvent {
    final int contactId;

    DeleteContactDetails(this.contactId);

  @override
  List<Object?> get props => [contactId];
}