import 'package:equatable/equatable.dart';
import 'package:ReCall2/person/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'person_event.dart';
part 'person_state.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  PersonBloc() : super(const PersonInitial()) {
    on<LoadPeople>((event, emit) async {
      emit( PersonLoading());
      try {
        // Replace with actual data fetching logic later
        await Future.delayed(const Duration(milliseconds: 500)); 
        final List<Person> people = []; // Fetch real data here
        emit(PersonLoaded(persons: people));
      } catch (e) {
        emit( const PersonError('Failed to load people'));
      }
    });

    on<LoadDummyPeople>((event, emit) async {
      emit( PersonLoading());
      try {
        await Future.delayed(const Duration(milliseconds: 500));
        final List<Person> dummyPeople = List.generate(3, (index) {
          return Person(
            id: index + 1,
            firstName: 'FirstName ${index + 1}',
            lastName: 'LastName ${index + 1}',
            birthday: DateTime.now().subtract(Duration(days: 365 * (20 + index))),
          );
        });
        emit(PersonLoaded(persons: dummyPeople));
      } catch (e) {
        emit( const PersonError('Failed to load dummy people'));
      }
    });
  }
}
