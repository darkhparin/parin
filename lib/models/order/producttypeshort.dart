import 'package:json_annotation/json_annotation.dart';

part 'producttypeshort.g.dart';

@JsonSerializable()
class Producttypeshort {
    Producttypeshort();

    num productId;
    String productName;
    
    factory Producttypeshort.fromJson(Map<String,dynamic> json) => _$ProducttypeshortFromJson(json);
    Map<String, dynamic> toJson() => _$ProducttypeshortToJson(this);
}
