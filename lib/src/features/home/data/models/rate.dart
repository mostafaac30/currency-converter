import 'package:json_annotation/json_annotation.dart';

// part 'rate.g.dart';

// "USD":1.23,

@JsonSerializable()
class Rate {
  @JsonKey(name: 'date')
  DateTime? date;
  @JsonKey(name: 'rate')
  double rate;
  @JsonKey(name: 'currency')
  String currency;

  Rate({
    this.date,
    required this.rate,
    required this.currency,
  });

  // factory Rate.fromJson(Map<String, dynamic> json) => _$RateFromJson(json);
  // Map<String, dynamic> toJson() => _$RateToJson(this);
}
