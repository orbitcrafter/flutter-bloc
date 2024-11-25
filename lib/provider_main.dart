import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sample/cubits/counter_cubit.dart';
import 'package:flutter_bloc_sample/cubits/counter_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            return Scaffold(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(state.counter.toString()),
                ],
              ),
              floatingActionButton: Row(
                children: [
                  IconButton(
                    onPressed: context.read<CounterCubit>().increase,
                    icon: const Icon(Icons.exposure_plus_1),
                  ),
                  IconButton(
                    onPressed: context.read<CounterCubit>().decrease,
                    icon: const Icon(Icons.exposure_minus_1),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
