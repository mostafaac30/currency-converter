// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeseries_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$TimeSeriesModelToJson(TimeSeriesModel instance) =>
    <String, dynamic>{
      'motd': instance.motd,
      'success': instance.success,
      'timeseries': instance.timeseries,
      'base': instance.baseCurrency,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'rates': instance.rates,
    };

Motd _$MotdFromJson(Map<String, dynamic> json) => Motd(
      msg: json['msg'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$MotdToJson(Motd instance) => <String, dynamic>{
      'msg': instance.msg,
      'url': instance.url,
    };
