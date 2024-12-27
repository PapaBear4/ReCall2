part of 'relationship_bloc.dart';

abstract class RelationshipEvent extends Equatable {
  const RelationshipEvent();

  @override
  List<Object> get props => [];
}

class AddRelationship extends RelationshipEvent {
  final Relationship relationship;

  const AddRelationship(this.relationship);

  @override
  List<Object> get props => [relationship];
}

class UpdateRelationship extends RelationshipEvent {
  final Relationship relationship;
  const UpdateRelationship(this.relationship);

  @override
  List<Object> get props => [relationship];
}


class DeleteRelationship extends RelationshipEvent {
  final String person1Id;
  final String person2Id;

  const DeleteRelationship({required this.person1Id, required this.person2Id});

  @override
  List<Object> get props => [person1Id, person2Id];
}
