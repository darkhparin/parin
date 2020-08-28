// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loadingTallyListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoadingTallyListModel _$LoadingTallyListModelFromJson(List json) {
  return LoadingTallyListModel()
    ..tally = json
        ?.map((e) => e == null
            ? null
            : LoadingTallyModel.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$LoadingTallyListModelToJson(
        LoadingTallyListModel instance) =>
    <String, dynamic>{'tally': instance.tally};
