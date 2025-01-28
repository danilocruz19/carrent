import 'package:flutter/material.dart';
import 'package:nvvmproject/viewmodels/car_viewmodel.dart';
import 'package:nvvmproject/viewmodels/counter_viewmodel.dart';
import 'package:provider/provider.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CounterViewmodel>();
    final carModel = context.watch<CarViewmodel>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Contador MVM'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Text(
                viewModel.counter.toString(),
                style: TextStyle(
                  fontSize: 40,
                  color: viewModel.counter >= 10 ? Colors.green : Colors.black,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: viewModel.increment,
              child: Text("Increment"),
            ),
            ElevatedButton(
              onPressed: viewModel.decrement,
              child: Text("Decrement"),
            ),
          ],
        ),
      ),
    );
  }
}
