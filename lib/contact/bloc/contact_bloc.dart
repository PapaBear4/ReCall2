import 'package:equatable/equatable.dart';
import 'package:ReCall2/contact/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(const ContactInitial()) {
    on<LoadContacts>((event, emit) async {
      emit( ContactLoading());
      try {
        // Replace with actual data fetching logic later
        await Future.delayed(const Duration(milliseconds: 500)); 
        final List<Contact> contacts = []; // Fetch real data here
        emit(ContactLoaded(contacts: contacts));
      } catch (e) {
        emit( const ContactError('Failed to load contacts'));
      }
    });

    on<LoadDummyContacts>((event, emit) async {
      emit( ContactLoading());
      try {
        await Future.delayed(const Duration(milliseconds: 500));
        final List<Contact> dummyContacts = List.generate(3, (index) {
          return Contact(
            id: index + 1,
            firstName: 'FirstName ${index + 1}',
            lastName: 'LastName ${index + 1}',
            birthday: DateTime.now().subtract(Duration(days: 365 * (20 + index))),
          );
        });
        emit(ContactLoaded(contacts: dummyContacts));
      } catch (e) {
        emit( const ContactError('Failed to load dummy contacts'));
      }
    });
  }
}
