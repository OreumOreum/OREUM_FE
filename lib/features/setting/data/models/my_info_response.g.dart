// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyInfoResponseImpl _$$MyInfoResponseImplFromJson(Map<String, dynamic> json) =>
    _$MyInfoResponseImpl(
      id: (json['id'] as num).toInt(),
      loginId: json['loginId'] as String,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phoneNo: json['phoneNo'] as String?,
      categoryType: json['categoryType'] as String?,
    );

Map<String, dynamic> _$$MyInfoResponseImplToJson(
        _$MyInfoResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'loginId': instance.loginId,
      'name': instance.name,
      'email': instance.email,
      'phoneNo': instance.phoneNo,
      'categoryType': instance.categoryType,
    };
