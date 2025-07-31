// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddressDto _$AddressDtoFromJson(Map<String, dynamic> json) => _AddressDto(
      id: (json['id'] as num).toInt(),
      region: (json['region'] as num).toInt(),
      city: (json['city'] as num).toInt(),
      township: (json['township'] as num).toInt(),
      streetAddress: json['street_address'] as String,
      isDeliveryAddress: (json['is_delivery_address'] as num).toInt(),
      isPrimaryAddress: (json['is_primary_address'] as num).toInt(),
    );

Map<String, dynamic> _$AddressDtoToJson(_AddressDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'region': instance.region,
      'city': instance.city,
      'township': instance.township,
      'street_address': instance.streetAddress,
      'is_delivery_address': instance.isDeliveryAddress,
      'is_primary_address': instance.isPrimaryAddress,
    };
