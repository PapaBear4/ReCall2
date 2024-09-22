import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'interaction_event.dart';
part 'interaction_state.dart';

class InteractionBloc extends Bloc<InteractionEvent, InteractionState> {
  InteractionBloc() : super(InteractionInitial()) {
    on<InteractionEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
