part of 'person_bloc.dart';

abstract class PersonEvent extends Equatable {
  const PersonEvent();

  @override
  List<Object> get props => [];
}

class LoadPerson extends PersonEvent {
  final int id; 
  const LoadPerson(this.id);

  @override
  List<Object> get props => [id];
}

class UpdatePerson extends PersonEvent {
  final Person person;
  const UpdatePerson(this.person);

  @override
  List<Object> get props => [person]; 
}

class CreatePerson extends PersonEvent {
  final Person person; // The new person to be created 
  const CreatePerson(this.person);

  @override
  List<Object> get props => [person];
}

class DeletePerson extends PersonEvent {
  final int id; // The ID of the person to be deleted
  const DeletePerson(this.id);

  @override
  List<Object> get props => [id];
}

class LoadPeople extends PersonEvent {
  // No need for parameters since you're loading all people

  const LoadPeople();

  @override
  List<Object> get props => []; // No properties to compare for equality
}

class LoadDummyPeople extends PersonEvent {
  final int numberOfPeople; 

  const LoadDummyPeople({required this.numberOfPeople});

  @override
  List<Object> get props => [numberOfPeople];
}





