// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tripServiceTypeListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripServiceTypeListModel _$TripServiceTypeListModelFromJson(List json) {
  return TripServiceTypeListModel()
    ..servicetypes = json
        ?.map((e) => e == null
            ? null
            : TripServiceTypeModel.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$TripServiceTypeListModelToJson(
        TripServiceTypeListModel instance) =>
    <String, dynamic>{'servicetypes': instance.servicetypes};
