import 'package:pray_time/models/times_model.dart';

class PrayTimeModel {
  String region;
  DateTime date;
  String weekday;
  TimesModel times;

  PrayTimeModel({
    required this.region,
    required this.date,
    required this.weekday,
    required this.times,
  });

  factory PrayTimeModel.fromJson(Map<String, dynamic> json) => PrayTimeModel(
        region: json["region"],
        date: DateTime.parse(json["date"]),
        weekday: json["weekday"],
        times: TimesModel.fromJson(json["times"]),
      );

  Map<String, dynamic> toJson() => {
        "region": region,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "weekday": weekday,
        "times": times.toJson(),
      };
}
