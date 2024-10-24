import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/feature/counter/presentation/bloc/counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  void increament(int value) {
    emit(CounterLoading());
    try {
      log('incoming value: $value');
      int newValue = value + 1;
      log('outgoing value: $newValue');
      emit(CounterSuccess(count: newValue));
    } catch (e) {
      emit(CounterFailure( error: e.toString()));
    }
  }
}
