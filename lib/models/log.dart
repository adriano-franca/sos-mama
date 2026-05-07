import 'dart:convert';

Log logFromJson(String str) {
  final jsonData = json.decode(str);
  return Log.fromMap(jsonData);
}

String logToJson(Log data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Log {
  int? id;
  String? data;
  String? hora;
  String? time;
  String? mama;

  Log({this.id, this.mama, this.data, this.hora, this.time});

  Map<String, dynamic> toMap() {
    return {
      "mama": mama,
      "data": data,
      "hora": hora,
      "time": time,
    };
  }

  factory Log.fromMap(Map<String, dynamic> json) => Log(
        id: json["id"],
        mama: json["mama"],
        data: json["data"],
        hora: json["hora"],
        time: json["time"],
      );
}
