import 'dart:async';

class MyBlock {
  //State Stream

  final StreamController<int> _stateStreamController = StreamController();

  StreamSink get stateStreamSink => _stateStreamController.sink;

  Stream<int> get stateStream => _stateStreamController.stream;

  //Event Stream

  final StreamController<int> _eventstreamController = StreamController();

  StreamSink get eventStreamSink => _eventstreamController.sink;

  Stream<int> get eventStream => _eventstreamController.stream;

  MyBlock() {
    eventStream.listen((event) {
      print(event);
      event++;
      stateStreamSink.add(event);
    });
  }
}
