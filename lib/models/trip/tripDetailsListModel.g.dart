// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tripDetailsListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripDetailsListModel _$TripDetailsListModelFromJson(List json) {
  return TripDetailsListModel()
    ..tripdetailsList = json
        ?.map((e) => e == null
            ? null
            : TripDetailsModel.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$TripDetailsListModelToJson(
        TripDetailsListModel instance) =>
    <String, dynamic>{'tripdetailsList': instance.tripdetailsList};
