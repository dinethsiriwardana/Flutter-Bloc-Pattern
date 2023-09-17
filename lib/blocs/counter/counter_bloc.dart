import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<CounterEvent>((event, emit) {
      if (event is IncrementEvent) {
        int val = event.value + 1;
        emit(IncrementState(value: val));
        // _stateStreamSink.add(IncrementState(value: val));
      } else if (event is DecrementEvent) {
        int val = event.value - 1;
        emit(DecrementState(value: val));

        // _stateStreamSink.add(DecrementState(value: val));
      }
    });
  }
}
