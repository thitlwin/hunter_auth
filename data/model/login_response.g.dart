// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    _LoginResponse(
      customer: CustomerDto.fromJson(json['customer'] as Map<String, dynamic>),
      addresses: (json['addresses'] as List<dynamic>?)
          ?.map((e) => AddressDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      token: json['token'] as String,
      firebaseToken: json['firebase_token'] as String,
      vouchers: json['vouchers'] as List<dynamic>,
    );

Map<String, dynamic> _$LoginResponseToJson(_LoginResponse instance) =>
    <String, dynamic>{
      'customer': instance.customer,
      'addresses': instance.addresses,
      'token': instance.token,
      'firebase_token': instance.firebaseToken,
      'vouchers': instance.vouchers,
    };

_CustomerDto _$CustomerDtoFromJson(Map<String, dynamic> json) => _CustomerDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      nrc: json['nrc'] as String?,
      profilePicture: json['profile_picture'] as String?,
      dob: json['dob'] as String?,
      weight: (json['weight'] as num?)?.toInt(),
      feet: (json['feet'] as num?)?.toInt(),
      inches: (json['inches'] as num?)?.toInt(),
      bmi: (json['bmi'] as num?)?.toDouble(),
      facebookId: json['facebook_id'] as String?,
      appleId: json['apple_id'] as String?,
    );

Map<String, dynamic> _$CustomerDtoToJson(_CustomerDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'nrc': instance.nrc,
      'profile_picture': instance.profilePicture,
      'dob': instance.dob,
      'weight': instance.weight,
      'feet': instance.feet,
      'inches': instance.inches,
      'bmi': instance.bmi,
      'facebook_id': instance.facebookId,
      'apple_id': instance.appleId,
    };

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
