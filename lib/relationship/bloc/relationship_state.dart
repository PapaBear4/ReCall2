part of 'relationship_bloc.dart';
/* 
RelationshipInitial
RelationshipLoading
RelationshipLoaded (contains the relationship data, potentially structured for visualization)
RelationshipError
*/
@immutable
sealed class RelationshipState {}

final class RelationshipInitial extends RelationshipState {}
