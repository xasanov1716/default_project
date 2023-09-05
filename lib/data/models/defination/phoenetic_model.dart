import 'license_model.dart';

class Phonetic {
  String text;
  String audio;
  String sourceUrl;
  License? license;

  Phonetic({
    required this.text,
    required this.audio,
    required this.sourceUrl,
    this.license,
  });

  factory Phonetic.fromJson(Map<String, dynamic> json) => Phonetic(
    text: json["text"],
    audio: json["audio"],
    sourceUrl: json["sourceUrl"],
    license: json["license"] == null ? null : License.fromJson(json["license"]),
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "audio": audio,
    "sourceUrl": sourceUrl,
    "license": license?.toJson(),
  };
}