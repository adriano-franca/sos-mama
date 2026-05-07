import '../classes/curent_time.dart';

class Dependencies {
  final Stopwatch stopwatch = Stopwatch();

  String transformMilliSecondsToString(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();

    String secondsStr = (seconds % 60).toString().padLeft(2, '0');
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');

    return '${minutesStr}m ${secondsStr}s';
  }

  CurrentTime transformMilliSecondsToTime(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();
    int hours = (minutes / 60).truncate();

    return CurrentTime(
        hundreds: hundreds % 100,
        seconds: seconds % 60,
        minutes: minutes % 60,
        hours: hours % 24);
  }
}
