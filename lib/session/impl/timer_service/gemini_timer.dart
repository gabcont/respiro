import 'dart:async';
import 'package:respiro/session/session.dart';

class GeminiTimer extends SessionTimerService{
  // 1. El StreamController es el tubo por donde enviaremos los datos
  final _controller = StreamController<Duration>.broadcast();
  Timer? _timer;
  Stopwatch? _inBetweenTicksWatch;

  // 2. Exponemos solo el stream (la salida del tubo) para que el Bloc lo escuche
  @override
  Stream<Duration> get timerStream => _controller.stream;

  void _wholeSecondPassed() {
    _controller.add(_inBetweenTicksWatch?.elapsed ?? Duration.zero);
  }

  @override
  void start(Duration interval) {
    // Evitamos tener dos timers corriendo a la vez
    _timer?.cancel(); 
    
    // Usamos Timer.periodic internamente

    _timer = Timer.periodic(interval, (timer) {
      _wholeSecondPassed();
    });

    // Creamos stopwatch
    _inBetweenTicksWatch ??= Stopwatch()..start();

  }

  @override
  void pause() {
    // Opción A: Cancelar el timer interno (ahorra recursos)
    _timer?.cancel();
    _inBetweenTicksWatch?.stop();
  }

  @override
  void resume() {
    // Reiniciamos el timer pero mantenemos el _currentSeconds acumulado
    final initialTime = _inBetweenTicksWatch!.elapsed;
    final Duration remainderToSecond = Duration(seconds: 1) - (initialTime - Duration(seconds: initialTime.inSeconds));
    _inBetweenTicksWatch?.start();
    _timer = Timer(
      remainderToSecond,
      () {
        _wholeSecondPassed();
        start(const Duration(seconds: 1));
      },
    );
  }

  @override
  void stop() {
    _timer?.cancel();
    //_controller.add(Duration.zero); // Opcional: notificar que volvió a 0
  }
  
  // Importante: cerrar el controller cuando la app muera (dispose)
  @override
  void dispose() {
    _timer?.cancel();
    _controller.close();
  }
}