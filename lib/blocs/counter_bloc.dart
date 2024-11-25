import 'package:bloc/bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    on<CounterIncreased>((event, emit) {
      emit(state.copyWith(counter: state.counter + 1));
    });

    on<CounterDecreased>((event, emit) {
      emit(state.copyWith(counter: state.counter - 1));
    });
  }
}
