import 'package:json_annotation/json_annotation.dart';

import 'country.dart';

part 'countries.g.dart';

@JsonSerializable()
class Countries {
  List<Country>? countries;

  Countries({this.countries});

  factory Countries.fromJson(Map<String, dynamic> json) => _$CountriesFromJson(json);
  Map<String, dynamic> toJson() => _$CountriesToJson(this);
}