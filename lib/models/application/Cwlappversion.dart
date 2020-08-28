import 'package:json_annotation/json_annotation.dart';

part 'Cwlappversion.g.dart';

@JsonSerializable()
class Cwlappversion {
    Cwlappversion();

    num id;
    num version;
    String versionName;
    
    factory Cwlappversion.fromJson(Map<String,dynamic> json) => _$CwlappversionFromJson(json);
    Map<String, dynamic> toJson() => _$CwlappversionToJson(this);
}
