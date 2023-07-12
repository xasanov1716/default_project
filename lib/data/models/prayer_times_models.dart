class PrayerTimesModel {
  final String tong;
  final String quyosh;
  final String peshin;
  final String asr;
  final String shom;
  final String hufton;

  PrayerTimesModel({
    required this.tong,
    required this.quyosh,
    required this.peshin,
    required this.asr,
    required this.shom,
    required this.hufton,
  });

  factory PrayerTimesModel.fromJson(Map<String, dynamic> json) {
    return PrayerTimesModel(
      tong: json["tong_saharlik"] as String? ?? "",
      quyosh: json["quyosh"] as String? ?? "",
      peshin: json["peshin"] as String? ?? "",
      asr: json["asr"] as String? ?? "",
      shom: json["shom_iftor"] as String? ?? "",
      hufton: json["hufton"] as String? ?? "",
    );
  }
}
