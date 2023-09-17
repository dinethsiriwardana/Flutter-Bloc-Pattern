import 'dart:async';

class MyBlock {
  StreamController<int> streamController = StreamController();

  StreamSink get streamSink => streamController.sink;

  Stream<int> get stream => streamController.stream;
}
