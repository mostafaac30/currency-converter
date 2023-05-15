import 'package:email_app/src/features/home/data/models/rates.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

// {
// "2020-01-01":{
// "USD":1.23,
// "EUR":1.23,
// "GBP":1.23,
// }
// }
@JsonSerializable()
class DatedRates {
  @JsonKey(name: 'date')
  final DateTime date;
  @JsonKey(name: 'rates')
  final List<Rates> rates;

  DatedRates({
    required this.rates,
    required this.date,
  });

  factory DatedRates.fromJson(Map<String, dynamic> json) {
    final rates = <Rates>[];
    final date = json.keys.first;
    json.forEach((key, value) {
      rates.add(Rates.fromJson(value));
    });
    return DatedRates(
      rates: rates,
      date: DateTime.parse(date),
    );
  }
  Map<String, dynamic> toJson() {
    // "2020-01-01":{
// "USD":1.23,
// "EUR":1.23,
// "GBP":1.23,
// }
    final json = <String, dynamic>{};
    // format date to yyyy-MM-dd use intl package
    final formater = DateFormat('yyyy-MM-dd');
    final date = formater.format(this.date);

    json[date] = rates.first.toJson();
    return json;
  }
}
