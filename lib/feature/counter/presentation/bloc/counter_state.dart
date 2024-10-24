abstract class CounterState {
   final int? count;
  CounterState({this.count = 0});
}

class CounterInitial extends CounterState {}

class CounterLoading extends CounterState {}

class CounterSuccess extends CounterState {
  CounterSuccess({required super.count});
}

class CounterFailure extends CounterState {
  final String error;
  CounterFailure({required this.error});
}
