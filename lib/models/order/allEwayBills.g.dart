// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'allEwayBills.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllEwayBills _$AllEwayBillsFromJson(List json) {
  return AllEwayBills()
    ..allEwayBills = (json)
        ?.map((e) =>
            e == null ? null : AllEwayBill.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$AllEwayBillsToJson(AllEwayBills instance) =>
    <String, dynamic>{'allEwayBills': instance.allEwayBills};
