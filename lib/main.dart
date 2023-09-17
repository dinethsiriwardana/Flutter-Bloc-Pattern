import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blocs/blocs/counter/counter_bloc.dart';
import 'package:flutter_blocs/my_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => CounterBloc(),
        child: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late CounterBloc counterBloc;
  // MyBlock myBlock = MyBlock();
  // CounterBloc counterBloc = CounterBloc();   //? Comment after adding the blocprovider

  @override
  void initState() {
    counterBloc = BlocProvider.of<CounterBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),

            BlocBuilder<CounterBloc, CounterState>(
              // bloc: counterBloc,  //? comment After adding the <CounterBloc , CounterState>
              builder: (context, state) {
                if (state is IncrementState) {
                  _counter = state.value;
                  return Text(
                    '${state.value}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                } else if (state is DecrementState) {
                  _counter = state.value;
                  return Text(
                    '${state.value}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                } else {
                  return Container();
                }
              },
            ),

            // StreamBuilder<MyState>(
            //     stream: myBlock.stateStream,
            //     builder: (context, snapshot) {
            //       if (snapshot.hasData) {
            //         MyState? state = snapshot.data;
            //         if (state is IncrementState) {
            //           _counter = state.value;
            //           return Text(
            //             '${state.value}',
            //             style: Theme.of(context).textTheme.headlineMedium,
            //           );
            //         } else if (state is DecrementState) {
            //           _counter = state.value;
            //           return Text(
            //             '${state.value}',
            //             style: Theme.of(context).textTheme.headlineMedium,
            //           );
            //         } else {
            //           return Container();
            //         }
            //       } else {
            //         return const CircularProgressIndicator();
            //       }
            //     }),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 130,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              onPressed: () {
                counterBloc.add(IncrementEvent(value: _counter));
                // myBlock.eventStreamSink.add(IncrementEvent(value: _counter));
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () {
                counterBloc.add(DecrementEvent(value: _counter));

                // myBlock.eventStreamSink.add(DecrementEvent(value: _counter));
              },
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
