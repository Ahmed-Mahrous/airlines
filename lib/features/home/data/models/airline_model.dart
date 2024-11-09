import 'package:equatable/equatable.dart';

class AirlineModel extends Equatable {
  final String name;
  final String logo;
  final String phone;
  final String website;

  const AirlineModel({
    required this.name,
    required this.logo,
    required this.phone,
    required this.website,
  });

  factory AirlineModel.fromJson(Map<String, dynamic> json) {
    return AirlineModel(
      name: json['name'],
      logo: json['logoURL'],
      phone: json['phone'] == '' ? "Not Available" : json['phone'],
      website: json['site'] == '' ? "Not Available" : json['site'],
    );
  }

  @override
  List<Object?> get props => [name, logo, phone, website];
}
