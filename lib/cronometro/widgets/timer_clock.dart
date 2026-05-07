import 'package:flutter/material.dart';

import '../classes/curent_time.dart';
import '../classes/dependencies.dart';

class TimerClock extends StatefulWidget {
  final Dependencies dependencies;

  const TimerClock(this.dependencies, {super.key});

  @override
  TimerClockState createState() => TimerClockState();
}

class TimerClockState extends State<TimerClock> {
  late CurrentTime currentTime;

  Paint? paint;

  @override
  void initState() {
    paint = Paint();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    currentTime = widget.dependencies.transformMilliSecondsToTime(
        widget.dependencies.stopwatch.elapsedMilliseconds);

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '${currentTime.minutes.toString().padLeft(2, '0')} : ${currentTime.seconds.toString().padLeft(2, '0')}.',
            style: const TextStyle(fontSize: 28.0),
          ),
          Text(
            currentTime.hundreds.toString().padLeft(2, '0'),
            style: const TextStyle(fontSize: 20.0),
          )
        ],
      ),
    );
  }
}
