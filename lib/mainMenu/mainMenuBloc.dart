import 'dart:async';

class MainMenuBloc {
  bool show = false;
  final _inputEventController = StreamController<ButtonEvent>();
  StreamSink<ButtonEvent> get inputEventSink => _inputEventController.sink;
  final _outputEventController = StreamController<bool>();
  Stream<bool> get outputEventSink => _outputEventController.stream;

  void _mapEventToState(ButtonEvent event) {
    if (event == ButtonEvent.eventShow) {
      show = true;
    } else if (event == ButtonEvent.eventHide) {
      show = false;
    }
  }

  MainMenuBloc() {
    _inputEventController.stream.listen(_mapEventToState);
  }

  void close() {
    _inputEventController.close();
    _outputEventController.close();
  }
}

enum ButtonEvent { eventShow, eventHide }
