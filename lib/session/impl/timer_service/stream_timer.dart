import 'dart:async';
import 'package:respiro/session/session.dart';

class StreamTimer implements SessionTimerService{
  StreamTimer();
  
  late Stream<int> _ticker;
  late StreamSubscription _subscription;
  final _controller = StreamController<Duration>.broadcast();

  @override
  Stream<Duration> get timerStream => _controller.stream;

  @override
  void start(Duration interval) {
    _ticker = Stream.periodic(
      interval,
      (x) => x + 1,
    );
    _subscription = _ticker.listen(_onTick);
  }

  void _onTick(int elapsedTime) {
    _controller.add(Duration(seconds: elapsedTime));
  }

  @override
  void pause() {
    _subscription.pause();
  }

  @override
  void resume() {
    _subscription.resume();
  }

  @override
  void stop() {
    _subscription.cancel();
  }
  
  // Importante: cerrar el controller cuando la app muera (dispose)
  @override
  void dispose() {
    _controller.close();
  }
  
}