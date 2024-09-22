
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ReCall2/person/models/models.dart';

part 'person_event.dart';
part 'person_state.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  PersonBloc() : super(PersonInitial()) {
    /*on<LoadPerson>((event, emit) async {
      emit(PersonLoading());
      try {
        // TODO: Load person data (e.g., from a repository)
        // await _personRepository.getPerson(event.id); 
        final person = Person( // Replace with actual data fetching
          id: event.id,
          firstName: 'John',
          lastName: 'Doe',
          birthday: DateTime(1990, 01, 01),
        );
        emit(PersonLoaded(person));
      } catch (e) {
        emit(PersonError('Failed to load person'));
      }
    });*/
    on<LoadPerson>((event, emit) {
      emit(PersonLoading());
      // Simulate data fetching delay
      Future.delayed(const Duration(milliseconds: 500), () {
        final dummyPersons = [
          Person(
              id: 1,
              firstName: 'Alice',
              lastName: 'Smith',
              birthday: DateTime(1990, 5, 15)),
          Person(
              id: 2,
              firstName: 'Bob',
              lastName: 'Johnson',
              birthday: DateTime(1985, 10, 22)),
          Person(
              id: 3,
              firstName: 'Charlie',
              lastName: 'Brown',
              birthday: DateTime(1998, 3, 8)),
        ];
        emit(PersonLoaded(
            dummyPersons[0])); // Assuming you only load one person for now
      });
    });


    on<UpdatePerson>((event, emit) {
      emit(PersonLoaded(event.person)); 
    });

    on<CreatePerson>((event, emit) async {
      emit(PersonCreating()); // Optional state to indicate creation in progress
      try {
        // TODO: Implement logic to create a new person 
        // final newPerson = await _personRepository.createPerson(event.person);
        // emit(PersonCreated(newPerson)); //  Optional state for successful creation
        emit(PersonLoaded(event.person));
      } catch (e) {
        emit(PersonError('Failed to create person.'));
      }
    });
    on<DeletePerson>((event, emit) async {
      emit(PersonDeleting()); // Optional state to indicate deletion in progress
      try {
        // TODO: Implement logic to delete a person
        // await _personRepository.deletePerson(event.id);
        // emit(PersonDeleted()); // Optional state for successful deletion 
      } catch (e) {
        emit(PersonError('Failed to delete person.'));
      }
    });
  }
}
