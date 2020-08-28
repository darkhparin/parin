// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otherEwayBills.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtherEwayBills _$OtherEwayBillsFromJson(Map<String, dynamic> json) {
  return OtherEwayBills()
    ..otherEwayBills = json['otherEwayBills'] == null
        ? null
        : AllEwayBill.fromJson(json['otherEwayBills'] as Map<String, dynamic>);
}

Map<String, dynamic> _$OtherEwayBillsToJson(OtherEwayBills instance) =>
    <String, dynamic>{'otherEwayBills': instance.otherEwayBills};
