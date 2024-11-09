import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'airline_model.g.dart';

class AirlineModel extends Equatable {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String logo;

  @HiveField(2)
  final String phone;

  @HiveField(3)
  final String website;

  const AirlineModel({
    required this.name,
    required this.logo,
    required this.phone,
    required this.website,
  });
  Map<String, dynamic> toJson() => {
        'name': name,
        'logoURL': logo,
        'phone': phone == "" ? "Not Available" : phone,
        'site': website == "" ? "Not Available" : website,
      };
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
