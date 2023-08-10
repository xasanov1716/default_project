class CountryEXP {
  final String code;
  final String name;
  final String phone;
  final Map<String, String> continent;
  final String capital;
  final String currency;
  final String emoji;

  CountryEXP(
      {required this.code,
        required this.name,
        required this.phone,
        required this.continent,
        required this.capital,
        required this.currency,
        required this.emoji});

  factory CountryEXP.fromJson(Map<String, dynamic> json) {
    return CountryEXP(
        code: json["code"] as String? ?? "",
        name: json["name"] as String? ?? "",
        phone: json["phone"] as String? ?? "",
        continent: json["continent"],
        capital: json["capital"] as String? ?? "",
        currency: json["currency"] as String? ?? "",
        emoji: json["emoji"] as String? ?? "");
  }
}