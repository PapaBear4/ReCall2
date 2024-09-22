part of 'interaction_bloc.dart';
/* 
InteractionInitial
InteractionLoading
InteractionLoaded (contains a list of Interaction objects)
InteractionError
*/
@immutable
sealed class InteractionState {}

final class InteractionInitial extends InteractionState {}
