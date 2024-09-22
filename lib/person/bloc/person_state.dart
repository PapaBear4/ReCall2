part of 'person_bloc.dart';

abstract class PersonState extends Equatable {
  const PersonState();

  @override
  List<Object?> get props => [];
}

class PersonInitial extends PersonState {
  final bool isLoading;

  const PersonInitial({this.isLoading = false});

  @override
  List<Object?> get props => [isLoading];
}

class PersonLoading extends PersonState {}

class PersonLoaded extends PersonState {
  final Person person;
  final bool isLoading;
  final bool isModified;

  const PersonLoaded(this.person,
      {this.isLoading = false, this.isModified = false});

  @override
  List<Object?> get props => [person, isLoading, isModified];
}

class PersonError extends PersonState {
  final String message;
  final Exception? error;
  final StackTrace? stackTrace;
  //final VoidCallback? retryAction; // Function to retry

  const PersonError(
    this.message, {
    this.error,
    this.stackTrace,
    /*this.retryAction*/
  });

  @override
  List<Object?> get props => [message, error, stackTrace];
}

class PersonCreating extends PersonState {}
class PersonCreated extends PersonState {
  final Person person; // The newly created person
  const PersonCreated(this.person);
  @override
  List<Object> get props => [person];
}
class PersonDeleting extends PersonState {}
class PersonDeleted extends PersonState {}
