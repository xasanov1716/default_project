import 'dart:convert';

import 'package:api_default_project/data/models/defination/phoenetic_model.dart';

import 'license_model.dart';
import 'meaning_model.dart';

List<DefinationModel> emptyFromJson(String str) => List<DefinationModel>.from(json.decode(str).map((x) => DefinationModel.fromJson(x)));

String emptyToJson(List<DefinationModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DefinationModel {
  String? word;
  String? phonetic;
  List<Phonetic>? phonetics;
  List<Meaning>? meanings;
  License? license;
  List<String>? sourceUrls;

  DefinationModel({
    this.word,
    this.phonetic,
    this.phonetics,
    this.meanings,
    this.license,
    this.sourceUrls,
  });

  factory DefinationModel.fromJson(Map<String, dynamic> json) => DefinationModel(
    word: json["word"],
    phonetic: json["phonetic"],
    phonetics: json["phonetics"] == null ? [] : List<Phonetic>.from(json["phonetics"]!.map((x) => Phonetic.fromJson(x))),
    meanings: json["meanings"] == null ? [] : List<Meaning>.from(json["meanings"]!.map((x) => Meaning.fromJson(x))),
    license: json["license"] == null ? null : License.fromJson(json["license"]),
    sourceUrls: json["sourceUrls"] == null ? [] : List<String>.from(json["sourceUrls"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "word": word,
    "phonetic": phonetic,
    "phonetics": phonetics == null ? [] : List<dynamic>.from(phonetics!.map((x) => x.toJson())),
    "meanings": meanings == null ? [] : List<dynamic>.from(meanings!.map((x) => x.toJson())),
    "license": license?.toJson(),
    "sourceUrls": sourceUrls == null ? [] : List<dynamic>.from(sourceUrls!.map((x) => x)),
  };


  static List<DefinationModel> getFromList(List? list) {
    return list?.map((e) => DefinationModel.fromJson(e)).toList() ?? [];
  }
}





