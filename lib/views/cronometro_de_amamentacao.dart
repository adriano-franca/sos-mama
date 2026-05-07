import '../widgets/widgets.dart';

import '../core/core.dart';
import 'package:flutter/material.dart';

import 'dart:async';

import 'package:intl/intl.dart';

import '../cronometro/classes/dependencies.dart';
import '../cronometro/widgets/timer_clock.dart';
import '../data/log_db_helper.dart';
import '../models/log.dart';
import '../models/mama_time.dart';

class CronometroDeAmamentacao extends StatefulWidget {
  static const title = 'Crônometro de Amamentação';

  static final routeName = '/${title.toLowerCase()}';

  const CronometroDeAmamentacao({super.key});
  static Map<String, String> get properties =>
      {'title': title, 'routeName': routeName};

  @override
  _CronometroDeAmamentacaoState createState() =>
      _CronometroDeAmamentacaoState();
}

class _CronometroDeAmamentacaoState extends State<CronometroDeAmamentacao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar("Crônometro de\nAmamentação", context: context),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(children: [
          UIHelper.largerVerticalSpacer,
          Row(
            children: <Widget>[
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(2),
                child: MamaCronometro(
                  mama: 'Esquerda',
                  addLogCallback: () {
                    setState(() {});
                  },
                ),
              )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(2),
                child: MamaCronometro(
                  mama: 'Direita',
                  addLogCallback: () {
                    setState(() {});
                  },
                ),
              ))
            ],
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8),
            child: FutureBuilder<List<Log>>(
              future: DBProvider.db.getAllLogs(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Log>> snapshot) {
                if (snapshot.hasData) {
                  return Scrollbar(
                    child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        Log item = snapshot.data![index];
                        return LogItem(
                          id: item.id,
                          mama: item.mama,
                          data: item.data,
                          hora: item.hora,
                          time: item.time,
                          deleteItem: () {
                            setState(() {
                              DBProvider.db.deleteLog(item.id);
                            });
                          },
                        );
                      },
                    ),
                  );
                } else {
                  return Container(child: null);
                }
              },
            ),
          ))
        ]),
      ),
    );
  }
}

class LogItem extends StatelessWidget {
  const LogItem({
    super.key,
    required this.id,
    required this.mama,
    required this.data,
    required this.hora,
    required this.time,
    required this.deleteItem,
  });

  final String? mama;
  final String? data;
  final String? hora;
  final String? time;
  final int? id;

  final Function deleteItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 235, 243),
            borderRadius: BorderRadius.circular(50)),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '#$id',
                style: const TextStyle(fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4, right: 5, bottom: 4),
              child: Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: primaryColor),
                child: Center(
                    child: Text(
                  mama![0],
                  style: const TextStyle(fontSize: 22, color: Colors.white),
                )),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  data!,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  hora!,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ),
            Center(
              child: Text(
                time!,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: deleteItem as void Function()?,
                child: const Icon(
                  Icons.delete,
                  color: primaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MamaTimerCell extends StatelessWidget {
  final MamaTime? mamaTime;
  const MamaTimerCell({super.key, this.mamaTime});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Row(
          children: <Widget>[
            Container(
              child: Text(mamaTime!.mama!),
            ),
            Text(mamaTime!.timer!),
          ],
        ),
      ),
    );
  }
}

class MamaCronometro extends StatefulWidget {
  final String? mama;
  final Function? addLogCallback;

  const MamaCronometro({super.key, this.mama, this.addLogCallback});

  @override
  _MamaCronometroState createState() => _MamaCronometroState();
}

class _MamaCronometroState extends State<MamaCronometro> {
  Stopwatch? stopwatch;
  Duration? duration;
  Timer? timer;

  final Dependencies dependencies = Dependencies();

  Icon playIcon =
      const Icon(Icons.play_arrow_outlined, color: Colors.white, size: 80);

  Icon pauseIcon =
      const Icon(Icons.stop_outlined, color: Colors.white, size: 80);

  Icon? icon;

  @override
  void initState() {
    super.initState();
    icon = playIcon;
    stopwatch = Stopwatch();
  }

  @override
  void dispose() {
    if (timer!.isActive) {
      timer!.cancel();
      timer = null;
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Mama',
                      style: TextStyle(fontSize: mediumFontSize)),
                  Text(
                    widget.mama!,
                    style: const TextStyle(fontSize: mediumFontSize),
                  )
                ],
              )
            ],
          ),
          UIHelper.smallVerticalSpacer,
          MaterialButton(
            onPressed: startStopWatch,
            color: primaryColor,
            textColor: Colors.white,
            padding: const EdgeInsets.all(16),
            shape: const CircleBorder(),
            child: icon,
          ),
          UIHelper.smallVerticalSpacer,
          Container(
            child: TimerClock(dependencies),
          ),
        ],
      ),
    );
  }

  int leftEspased = 0;

  Future<void> startStopWatch() async {
    if (dependencies.stopwatch.isRunning) {
      dependencies.stopwatch.stop();
      leftEspased += dependencies.stopwatch.elapsedMilliseconds;

      var now = DateTime.now();
      var log = Log(
          mama: widget.mama,
          data: DateFormat("dd/MM/yyyy").format(now),
          hora: DateFormat("HH:mm").format(now),
          time: dependencies.transformMilliSecondsToString(
              dependencies.stopwatch.elapsedMilliseconds));

      await DBProvider.db.newLog(log);

      widget.addLogCallback!();
      dependencies.stopwatch.reset();

      setState(() {
        icon = playIcon;
      });
    } else {
      setState(() {
        icon = pauseIcon;
      });
      dependencies.stopwatch.start();
      timer = Timer.periodic(const Duration(milliseconds: 20), updateTime);
    }
  }

  void updateTime(Timer timer) {
    if (dependencies.stopwatch.isRunning) {
      setState(() {});
    } else {
      timer.cancel();
    }
  }
}
