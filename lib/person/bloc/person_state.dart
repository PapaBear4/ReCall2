part of 'person_bloc.dart';
/* 
PersonInitial
PersonLoading
PersonLoaded (contains a list of Person objects)
PersonError
*/
@immutable
sealed class PersonState {}

final class PersonInitial extends PersonState {}
