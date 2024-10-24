import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/feature/counter/presentation/pages/counter_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Bloc'),
        backgroundColor: Colors.amber.shade200,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const CounterPage())),
            child: const Text('Go to Counter')),
      ),
    );
  }
}
