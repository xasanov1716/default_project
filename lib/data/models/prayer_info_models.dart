
import 'package:api_default_project/data/models/prayer_times_models.dart';

class PrayerInfoModel {
  final String region;
  final String date;
  final String weekday;
  final PrayerTimesModel times;

  PrayerInfoModel({
    required this.region,
    required this.date,
    required this.weekday,
    required this.times,
  });

  factory PrayerInfoModel.fromJson(Map<String, dynamic> json) {
    return PrayerInfoModel(
      region: json["region"] as String? ?? "",
      date: json["date"] as String? ?? "",
      weekday: json["weekday"] as String? ?? "",
      times: PrayerTimesModel.fromJson(json["times"]),
    );
  }
}
