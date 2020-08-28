// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tripRouteModelList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripRouteModelList _$TripRouteModelListFromJson(List json) {
  return TripRouteModelList()
    ..triproutes = json
        ?.map((e) => e == null
            ? null
            : TripRouteModel.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$TripRouteModelListToJson(TripRouteModelList instance) =>
    <String, dynamic>{'triproutes': instance.triproutes};
