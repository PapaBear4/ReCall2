import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ReCall2/contact/bloc/contact_details_event.dart';
import 'package:ReCall2/contact/bloc/contact_details_state.dart';
import 'package:ReCall2/contact/models/contact.dart';
import 'package:ReCall2/repositories/contact_repository.dart';

class ContactDetailsBloc
    extends Bloc<ContactDetailsEvent, ContactDetailsState> {
  final ContactRepository contactRepository;

  ContactDetailsBloc({required this.contactRepository})
      : super(ContactDetailsLoading()) {
    on<LoadContactDetails>((event, emit) async {
      emit(ContactDetailsLoading());
      try {
        emit(ContactDetailsLoaded(contact: event.contact));
      } catch (e) {
        emit(ContactDetailsError(message: e.toString()));
      }
    });

    on<UpdateContactDetails>((event, emit) async {
      emit(ContactDetailsLoading());
      try {
        await contactRepository.updateContact(event.contact);
        emit(ContactDetailsLoaded(contact: event.contact));
      } catch (e) {
        emit(ContactDetailsError(message: e.toString()));
      }
    });

    on<DeleteContactDetails>((event, emit) async {
      emit(ContactDetailsLoading());
      try {
        await contactRepository.deleteContact(event.contact.id!);
        emit(const ContactDetailsLoaded(contact: null)); // Emit null contact to indicate deletion
      } catch (e) {
        emit(ContactDetailsError(message: e.toString()));
      }
    });
  }
}