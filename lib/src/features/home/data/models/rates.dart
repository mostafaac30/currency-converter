import 'package:email_app/src/features/home/data/models/rate.dart';
import 'package:json_annotation/json_annotation.dart';

// {
// "USD":1.23,
// "EUR":1.23,
// "GBP":1.23,
// }
@JsonSerializable()
class Rates {
  @JsonKey(name: 'rates')
  final List<Rate> rates;

  Rates({
    required this.rates,
  });

  factory Rates.fromJson(Map<String, dynamic> json) {
    final rates = <Rate>[];
    json.forEach((key, value) {
      rates.add(Rate(
        currency: key,
        rate: value,
      ));
    });
    return Rates(
      rates: rates,
    );
  }
  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    for (var element in rates) {
      json[element.currency] = element.rate;
    }
    return json;
  }
}
