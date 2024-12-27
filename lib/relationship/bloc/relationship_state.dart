part of 'relationship_bloc.dart';

abstract class RelationshipState extends Equatable {
  const RelationshipState();

  @override
  List<Object> get props => [];
}

class RelationshipInitial extends RelationshipState {}

class RelationshipLoading extends RelationshipState {}

class RelationshipLoaded extends RelationshipState {
  final List<Relationship> relationships;

  const RelationshipLoaded(this.relationships);

  @override
  List<Object> get props => [relationships];
}

class RelationshipError extends RelationshipState {
  final String message;

  const RelationshipError(this.message);

  @override
  List<Object> get props => [message];
}
