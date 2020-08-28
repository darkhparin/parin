// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tripTypeListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripTypeListModel _$TripTypeListModelFromJson(List json) {
  return TripTypeListModel()
    ..tripTypes = json
        ?.map((e) => e == null
            ? null
            : TripTypeModel.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$TripTypeListModelToJson(TripTypeListModel instance) =>
    <String, dynamic>{'tripTypes': instance.tripTypes};
