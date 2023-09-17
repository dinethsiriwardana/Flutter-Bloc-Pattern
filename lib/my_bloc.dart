import 'dart:async';

import 'package:flutter/foundation.dart';

class MyBlock {
  //State Stream

  final StreamController<MyState> _stateStreamController = StreamController();

  StreamSink get _stateStreamSink => _stateStreamController.sink;

  Stream<MyState> get stateStream => _stateStreamController.stream;

  //Event Stream

  final StreamController<Event> _eventstreamController = StreamController();

  StreamSink get eventStreamSink => _eventstreamController.sink;

  Stream<Event> get _eventStream => _eventstreamController.stream;

  MyBlock() {
    _eventStream.listen((event) {
      if (kDebugMode) {
        print(event);
      }
      bussinessLogic(event);
      // _stateStreamSink.add(event);
    });
  }

  void bussinessLogic(Event event) {
    int? val;
    if (event is IncrementEvent) {
      val = event.value + 1;
      _stateStreamSink.add(IncrementState(value: val));
    } else if (event is DecrementEvent) {
      val = event.value - 1;
      _stateStreamSink.add(DecrementState(value: val));
    }
  }
}

abstract class Event {}

class IncrementEvent extends Event {
  int value;
  IncrementEvent({required this.value});
}

class DecrementEvent extends Event {
  int value;
  DecrementEvent({required this.value});
}

abstract class MyState {}

class IncrementState extends MyState {
  int value;
  IncrementState({required this.value});
}

class DecrementState extends MyState {
  int value;
  DecrementState({required this.value});
}
