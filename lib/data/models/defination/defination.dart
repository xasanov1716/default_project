class Definition {
  String definition;
  List<String> synonyms;
  List<dynamic> antonyms;
  String? example;

  Definition({
    required this.definition,
    required this.synonyms,
    required this.antonyms,
    this.example,
  });

  factory Definition.fromJson(Map<String, dynamic> json) => Definition(
    definition: json["definition"],
    synonyms: List<String>.from(json["synonyms"].map((x) => x)),
    antonyms: List<dynamic>.from(json["antonyms"].map((x) => x)),
    example: json["example"],
  );

  Map<String, dynamic> toJson() => {
    "definition": definition,
    "synonyms": List<dynamic>.from(synonyms.map((x) => x)),
    "antonyms": List<dynamic>.from(antonyms.map((x) => x)),
    "example": example,
  };
}