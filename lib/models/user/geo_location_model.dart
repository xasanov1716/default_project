class GeoLocation{
  final String lat;
  final String long;

  GeoLocation({required this.lat, required this.long});

  factory GeoLocation.fromJson(Map<String, dynamic> json){
    return GeoLocation(lat: json['lat']as String? ?? '', long: json['long']as String? ?? '');
  }
}