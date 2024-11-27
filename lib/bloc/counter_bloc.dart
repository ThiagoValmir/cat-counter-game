import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    on<CounterRandomPressed>((event, emit) {
      final random = Random();
      final randomValue = 10 + random.nextInt(11);
      emit(CounterState(0));
      emit(CounterState(randomValue));
    });
  }
}
