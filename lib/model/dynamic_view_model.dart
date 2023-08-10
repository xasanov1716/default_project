class DynamicViewModel {
  final String title; //
  final int sort;
  final String group;
  final num width;
  final num height;
  final String color;
  final String type;

  DynamicViewModel(
      {required this.group,
      required this.sort,
      required this.color,
      required this.width,
      required this.height,
      required this.title,
      required this.type});

  factory DynamicViewModel.fromJson(Map<String, dynamic> json) {
    return DynamicViewModel(
      group: json["group"] as String? ?? "",
      sort: json["sort"] as int? ?? 0,
      color: json["color"] as String? ?? "",
      width: json["width"] as num? ?? 0,
      height: json["height"] as num? ?? 0,
      title: json["title"] as String? ?? "",
      type: json["type"] as String? ?? "",
    );
  }
}
