import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/feature/counter/presentation/bloc/counter_cubit.dart';
import 'package:flutter_bloc_example/feature/counter/presentation/bloc/counter_state.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BlocBuilder<CounterCubit, CounterState>(
              bloc: context.read<CounterCubit>(),
              builder: (context, state) {
                if (state is CounterLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is CounterSuccess) {
                  return Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(text: 'Counter Value: ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal)),
                        TextSpan(
                            text: '${state.count}',
                            style:
                                const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  );
                }
                if (state is CounterFailure) {
                  return Text(state.error);
                }
                if (state is CounterInitial) {
                  return const Text('Please press a button');
                }

                return const SizedBox.shrink();
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  heroTag: 'increment',
                  onPressed: () => context.read<CounterCubit>().increament(context.read<CounterCubit>().state.count!),
                  child: const Text(
                    '+',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                FloatingActionButton(
                  heroTag: 'decreament',
                  onPressed: () {},
                  child: const Text(
                    '-',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
