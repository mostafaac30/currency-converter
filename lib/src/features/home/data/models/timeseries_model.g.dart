// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timeseries_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeSeriesModel _$TimeSeriesModelFromJson(Map<String, dynamic> json) =>
    TimeSeriesModel(
      motd: Motd.fromJson(json['motd'] as Map<String, dynamic>),
      success: json['success'] as bool,
      timeseries: json['timeseries'] as bool,
      baseCurrency: json['base'] as String,
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
      rates: (json['rates'] as List<dynamic>?)
          ?.map((e) => Rate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

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
