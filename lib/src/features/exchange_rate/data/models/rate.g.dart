// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rate _$RateFromJson(Map<String, dynamic> json) => Rate(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      rate: (json['rate'] as num).toDouble(),
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$RateToJson(Rate instance) => <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'rate': instance.rate,
      'currency': instance.currency,
    };
