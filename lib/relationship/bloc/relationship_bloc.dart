import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'relationship_event.dart';
part 'relationship_state.dart';

class RelationshipBloc extends Bloc<RelationshipEvent, RelationshipState> {
  RelationshipBloc() : super(RelationshipInitial()) {
    on<RelationshipEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
