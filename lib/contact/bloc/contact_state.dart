part of 'contact_bloc.dart';

abstract class ContactState extends Equatable {
  const ContactState();

  @override
  List<Object?> get props => [];
}

class ContactInitial extends ContactState {
  final bool isLoading;

  const ContactInitial({this.isLoading = false});

  @override
  List<Object?> get props => [isLoading];
}

class ContactLoading extends ContactState {}

class ContactLoaded extends ContactState {
      final List<Contact> contacts;
      final bool isLoading;
      final bool isModified;
    
      const ContactLoaded(
          {this.isLoading = false,
          this.isModified = false,
          required this.contacts});
    
      @override
      List<Object?> get props => [contacts, isLoading, isModified];
    }
class ContactError extends ContactState {
  final String message;
  final Exception? error;
  final StackTrace? stackTrace;
  //final VoidCallback? retryAction; // Function to retry

  const ContactError(
    this.message, {
    this.error,
    this.stackTrace,
    /*this.retryAction*/
  });

  @override
  List<Object?> get props => [message, error, stackTrace];
}

class ContactCreating extends ContactState {}
class ContactCreated extends ContactState {
  final Contact contact; // The newly created contact
  const ContactCreated(this.contact);
  @override
  List<Object> get props => [contact];
}
class ContactDeleting extends ContactState {}
class ContactDeleted extends ContactState {}
