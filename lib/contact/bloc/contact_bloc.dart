import 'package:equatable/equatable.dart';
import 'package:ReCall2/contact/models/contact.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ReCall2/repositories/contact_repository.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final ContactRepository contactRepository;

  ContactBloc({required this.contactRepository}) : super(ContactInitial()) {
    on<FetchContacts>((event, emit) async {
      emit(ContactLoading());
      try {
        final contacts = await contactRepository.getContacts();
        final contactsWithImportance = contacts
            .map((c) => c.copyWith(importance: ContactImportance.Medium))
            .toList();
        emit(ContactLoaded(contacts: contactsWithImportance));
      } catch (e) {
        emit(ContactError(
            'Failed to load contacts: ${e.toString()}')); // Pass message to state
      }
    });
    on<FetchContacts>((event, emit) async {
      emit(ContactsLoading());
      try {
        final contacts = await contactRepository.getContacts();
        emit(ContactsLoaded(contacts));
      } catch (e) {
        emit(ContactsError(message: e.toString())); // Pass message to state
      }
    });

    on<UpdateContact>((event, emit) async {
      if (state is ContactsLoaded) {
        final updatedContacts = (state as ContactsLoaded).contacts.map((c) {
          return c.id == event.contact.id ? event.contact : c;
        }).toList();
        emit(ContactsLoaded(updatedContacts));
      }
    });
  }
}
