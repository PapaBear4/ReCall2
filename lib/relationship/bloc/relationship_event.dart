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
  final String contact1Id;
  final String contact2Id;

  const DeleteRelationship({required this.contact1Id, required this.contact2Id});

  @override
  List<Object> get props => [contact1Id, contact2Id];
}
