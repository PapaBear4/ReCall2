import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ReCall2/relationship/models/models.dart';

part 'relationship_event.dart';
part 'relationship_state.dart';

class RelationshipBloc extends Bloc<RelationshipEvent, RelationshipState> {
  RelationshipBloc() : super(RelationshipInitial()) {
    on<AddRelationship>((event, emit) async {
      emit( RelationshipLoading());
      try {
        // TODO: Add relationship to data store
        // For now, just emit a loaded state with a dummy list
        const relationships = [
          Relationship(contact1Id: '1', contact2Id: '2', relationshipType: 'Friend', startDate: null, endDate: null),
          Relationship(contact1Id: '1', contact2Id: '3', relationshipType: 'Colleague', startDate: null, endDate: null),
          Relationship(contact1Id: '2', contact2Id: '4', relationshipType: 'Family', startDate: null, endDate: null),
          // Add more dummy relationships here...
        ];
        emit(const RelationshipLoaded(relationships)); 
      } catch (e) {
        emit(RelationshipError(e.toString())); // Cannot be const since it takes a variable
      }
    });

    on<UpdateRelationship>((event, emit) async {
      emit( RelationshipLoading());
      try {
         // TODO: Update relationship in data store
        // For now, just emit a loaded state with an empty list
        emit(const RelationshipLoaded([])); 
      } catch (e) {
        emit(RelationshipError(e.toString())); // Cannot be const since it takes a variable
      }
    });

    on<DeleteRelationship>((event, emit) async {
      emit( RelationshipLoading());
      try {
        // TODO: Delete relationship from data store
        // For now, just emit a loaded state with an empty list
        emit(const RelationshipLoaded([]));
      } catch (e) {
        emit(RelationshipError(e.toString())); 
      }
    });
  }
}