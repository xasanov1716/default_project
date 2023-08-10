// To parse this JSON data, do
//
//     final empty = emptyFromJson(jsonString);

import 'dart:convert';

CountryData emptyFromJson(String str) => CountryData.fromJson(json.decode(str));

String emptyToJson(CountryData data) => json.encode(data.toJson());

class CountryData {
  Data data;

  CountryData({
    required this.data,
  });

  factory CountryData.fromJson(Map<String, dynamic> json) => CountryData(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  List<Country> countries;

  Data({
    required this.countries,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    countries: List<Country>.from(json["countries"].map((x) => Country.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
  };
}

class Country {
  String code;
  String name;
  String phone;
  Continent continent;
  String? capital;
  String? currency;
  String emoji;

  Country({
    required this.code,
    required this.name,
    required this.phone,
    required this.continent,
    this.capital,
    this.currency,
    required this.emoji,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    code: json["code"],
    name: json["name"],
    phone: json["phone"],
    continent: Continent.fromJson(json["continent"]),
    capital: json["capital"],
    currency: json["currency"],
    emoji: json["emoji"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "name": name,
    "phone": phone,
    "continent": continent.toJson(),
    "capital": capital,
    "currency": currency,
    "emoji": emoji,
  };
}

class Continent {
  Code code;
  Name name;

  Continent({
    required this.code,
    required this.name,
  });

  factory Continent.fromJson(Map<String, dynamic> json) => Continent(
    code: codeValues.map[json["code"]]!,
    name: nameValues.map[json["name"]]!,
  );

  Map<String, dynamic> toJson() => {
    "code": codeValues.reverse[code],
    "name": nameValues.reverse[name],
  };
}

enum Code {
  AF,
  AN,
  AS,
  EU,
  NA,
  OC,
  SA
}

final codeValues = EnumValues({
  "AF": Code.AF,
  "AN": Code.AN,
  "AS": Code.AS,
  "EU": Code.EU,
  "NA": Code.NA,
  "OC": Code.OC,
  "SA": Code.SA
});

enum Name {
  AFRICA,
  ANTARCTICA,
  ASIA,
  EUROPE,
  NORTH_AMERICA,
  OCEANIA,
  SOUTH_AMERICA
}

final nameValues = EnumValues({
  "Africa": Name.AFRICA,
  "Antarctica": Name.ANTARCTICA,
  "Asia": Name.ASIA,
  "Europe": Name.EUROPE,
  "North America": Name.NORTH_AMERICA,
  "Oceania": Name.OCEANIA,
  "South America": Name.SOUTH_AMERICA
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}