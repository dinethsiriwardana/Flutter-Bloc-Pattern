import 'dart:async';

class MyBlock {
  final StreamController<int> _statestreamController = StreamController();

  StreamSink get statestreamSink => _statestreamController.sink;

  Stream<int> get statestream => _statestreamController.stream;
}
