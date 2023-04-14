import 'package:counter_app/counter/bloc/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    const TextStyle fontSize30 = TextStyle(fontSize: 30);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Counter App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Número de clicks',
                style: fontSize30,
              ),
              BlocBuilder<CounterCubit, int>(
                builder: (context, state) => Text(
                  '$state',
                  style: fontSize30,
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: ListFloatingActions(
          increaseFn: () => context.read<CounterCubit>().increment(),
          decreaseFn: () => context.read<CounterCubit>().decrement(),
          resetFn: () => context.read<CounterCubit>().reset(),
        ));
  }
}

class ListFloatingActions extends StatelessWidget {
  const ListFloatingActions(
      {super.key,
      required this.increaseFn,
      required this.decreaseFn,
      required this.resetFn});
  final Function increaseFn;
  final Function decreaseFn;
  final Function resetFn;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FloatingActionButton(
          onPressed: () => decreaseFn(),
          child: const Icon(
            Icons.exposure_minus_1,
            size: 30,
          ),
        ),
        FloatingActionButton(
          onPressed: () => resetFn(),
          child: const Icon(
            Icons.restart_alt,
            size: 30,
          ),
        ),
        FloatingActionButton(
          onPressed: () => increaseFn(),
          child: const Icon(
            Icons.exposure_plus_1,
            size: 30,
          ),
        ),
      ],
    );
  }
}
