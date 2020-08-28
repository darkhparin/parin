// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tripDetailsModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TripDetailsModel _$TripDetailsModelFromJson(Map<String, dynamic> json) {
  return TripDetailsModel()
    ..id = json['id'] as num
    ..tcvlhc = json['tcvlhc'] as String
    ..mode = json['mode'] as String
    ..modeId = json['modeId'] as num
    ..origin = json['origin'] as String
    ..destination = json['destination'] as String
    ..lastLocation = json['lastLocation'] as String
    ..lastLocationDate = json['lastLocationDate'] as String
    ..lastLocationAddress = json['lastLocationAddress'] as String
    ..date = json['date'] as String
    ..currentTrip = json['currentTrip'] as String
    ..carrier = json['carrier'] as String
    ..resource = json['resource'] as String
    ..status = json['status'] as String
    ..tripId = json['tripId'] as num
    ..planButtonVisibility = json['planButtonVisibility'] as String
    ..originTime = json['originTime'] as String
    ..destinationTime = json['destinationTime'] as String
    ..isUpTrip = json['isUpTrip'] as bool
    ..isUpTripIconVisisbility = json['isUpTripIconVisisbility'] as String
    ..isUpTripIcon = json['isUpTripIcon'] as String
    ..isUpTripIconColor = json['isUpTripIconColor'] as String
    ..actionColor = json['actionColor'] as String
    ..canCreateDownTrip = json['canCreateDownTrip'] as bool
    ..modeIcon = json['modeIcon'] as String
    ..modeIconColor = json['modeIconColor'] as String
    ..ltVisibility = json['ltVisibility'] as String
    ..isContainerBody = json['isContainerBody'] as bool
    ..fromLocation = json['fromLocation'] == null
        ? null
        : LatLongModel.fromJson(json['fromLocation'] as Map<String, dynamic>)
    ..toLocation = json['toLocation'] == null
        ? null
        : LatLongModel.fromJson(json['toLocation'] as Map<String, dynamic>)
    ..currentLocation = json['currentLocation'] == null
        ? null
        : LatLongModel.fromJson(
            json['currentLocation'] as Map<String, dynamic>);
}

Map<String, dynamic> _$TripDetailsModelToJson(TripDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tcvlhc': instance.tcvlhc,
      'mode': instance.mode,
      'modeId': instance.modeId,
      'origin': instance.origin,
      'destination': instance.destination,
      'lastLocation': instance.lastLocation,
      'lastLocationDate': instance.lastLocationDate,
      'lastLocationAddress': instance.lastLocationAddress,
      'date': instance.date,
      'currentTrip': instance.currentTrip,
      'carrier': instance.carrier,
      'resource': instance.resource,
      'status': instance.status,
      'tripId': instance.tripId,
      'planButtonVisibility': instance.planButtonVisibility,
      'originTime': instance.originTime,
      'destinationTime': instance.destinationTime,
      'isUpTrip': instance.isUpTrip,
      'isUpTripIconVisisbility': instance.isUpTripIconVisisbility,
      'isUpTripIcon': instance.isUpTripIcon,
      'isUpTripIconColor': instance.isUpTripIconColor,
      'actionColor': instance.actionColor,
      'canCreateDownTrip': instance.canCreateDownTrip,
      'modeIcon': instance.modeIcon,
      'modeIconColor': instance.modeIconColor,
      'ltVisibility': instance.ltVisibility,
      'isContainerBody': instance.isContainerBody,
      'fromLocation': instance.fromLocation,
      'toLocation': instance.toLocation,
      'currentLocation': instance.currentLocation
    };
