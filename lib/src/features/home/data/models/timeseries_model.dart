import 'package:json_annotation/json_annotation.dart';

import 'rate.dart';

part 'timeseries_model.g.dart';

@JsonSerializable()
class TimeSeriesModel {
  @JsonKey(name: 'motd')
  final Motd motd;
  @JsonKey(name: 'success')
  final bool success;
  @JsonKey(name: 'timeseries')
  final bool timeseries;
  @JsonKey(name: 'base')
  final String baseCurrency;
  @JsonKey(name: 'start_date')
  final String startDate;
  @JsonKey(name: 'end_date')
  final String endDate;
  @JsonKey(name: 'rates')
  List<Rate>? rates;

  TimeSeriesModel({
    required this.motd,
    required this.success,
    required this.timeseries,
    required this.baseCurrency,
    required this.startDate,
    required this.endDate,
    this.rates,
  });

  factory TimeSeriesModel.fromJson(Map<String, dynamic> json) {
    final ratesJson = json['rates'] as Map<String, dynamic>;
    final rates = <Rate>[];
    // ratesJson
    // is map of key object pairs
    // key is date
    // object is map of key(currency) value(double) pairs
    // loop through the map to make list of "Rate" objects

    ratesJson.forEach((key, value) {
      final date = DateTime.parse(key);
      final currencies = value as Map<String, dynamic>;
      currencies.forEach((key, value) {
        rates.add(Rate(
          date: date,
          currency: key,
          rate: double.parse(value.toString()),
        ));
      });
    });

    return TimeSeriesModel(
      motd: Motd.fromJson(json['motd'] as Map<String, dynamic>),
      success: json['success'] as bool,
      timeseries: json['timeseries'] as bool,
      baseCurrency: json['base'] as String,
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
      rates: rates,
    );
  }

  Map<String, dynamic> toJson() => _$TimeSeriesModelToJson(this);
}

@JsonSerializable()
class Motd {
  @JsonKey(name: 'msg')
  final String msg;
  @JsonKey(name: 'url')
  final String url;

  Motd({required this.msg, required this.url});

  factory Motd.fromJson(Map<String, dynamic> json) => _$MotdFromJson(json);

  Map<String, dynamic> toJson() => _$MotdToJson(this);
}
