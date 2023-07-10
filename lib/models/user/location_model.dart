import 'geo_location_model.dart';

class Location {
  final GeoLocation geolocation;
  final String city;
  final String street;
  final int number;
  final String zipcode;

  Location(
      {required this.geolocation,
      required this.city,
      required this.street,
      required this.number,
      required this.zipcode});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
        geolocation: GeoLocation.fromJson(json['geolocation']),
        city: json['city']as String? ?? '',
        street: json['street']as String? ?? '',
        number: json['number']as int? ?? 0,
        zipcode: json['zipcode']as String? ?? '');
  }
}
