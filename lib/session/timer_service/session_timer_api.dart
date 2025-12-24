abstract class SessionTimerService{

  Stream<Duration> get timerStream => Stream.empty();

  void start(Duration interval);

  void stop();

  void pause();

  void resume();

  void dispose();

}