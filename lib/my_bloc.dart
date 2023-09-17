import 'dart:async';

import 'package:flutter/foundation.dart';

class MyBlock {
  //State Stream

  final StreamController<int> _stateStreamController = StreamController();

  StreamSink get _stateStreamSink => _stateStreamController.sink;

  Stream<int> get stateStream => _stateStreamController.stream;

  //Event Stream

  final StreamController<int> _eventstreamController = StreamController();

  StreamSink get eventStreamSink => _eventstreamController.sink;

  Stream<int> get _eventStream => _eventstreamController.stream;

  MyBlock() {
    _eventStream.listen((event) {
      if (kDebugMode) {
        print(event);
      }
      counter(event);
      _stateStreamSink.add(event);
    });
  }

  void counter(event) {
    event++;
  }
}
