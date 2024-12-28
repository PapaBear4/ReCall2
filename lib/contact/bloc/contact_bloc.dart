import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ReCall2/contact/models/models.dart';
import 'package:ReCall2/repositories/contact_repository.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final ContactRepository contactRepository;

  ContactBloc({required this.contactRepository}) : super(ContactInitial()) {
    on<LoadContacts>((event, emit) async {
      emit(ContactLoading());
      try {
        final contacts = await contactRepository.getContacts();
        final contactsWithImportance = contacts
            .map((c) => c.copyWith(importance: ContactImportance.Medium))
            .toList();
        emit(ContactLoaded(contacts: contactsWithImportance));
      } catch (e) {
        emit(ContactError('Failed to load contacts: ${e.toString()}'));
      }
    });
  }
}