import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/feature/counter/presentation/bloc/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial()); // Initialize with CounterInitial state

  void increament(int value) {
    emit(CounterLoading()); // Emit loading state before processing
    try {
      log('incoming value: $value'); // Log the received value
      int newValue = value + 1;
      log('outgoing value: $newValue'); // Log the new value after increment
      emit(CounterSuccess(count: newValue)); // Emit success state with new value
    } catch (e) {
      emit(CounterFailure(error: e.toString())); // Emit failure state if an error occurs
    }
  }
}
