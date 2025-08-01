// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddressDto {

 int get id; int get region; int get city; int get township;@JsonKey(name: 'street_address') String get streetAddress;@JsonKey(name: 'is_delivery_address') int get isDeliveryAddress;@JsonKey(name: 'is_primary_address') int get isPrimaryAddress;
/// Create a copy of AddressDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddressDtoCopyWith<AddressDto> get copyWith => _$AddressDtoCopyWithImpl<AddressDto>(this as AddressDto, _$identity);

  /// Serializes this AddressDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddressDto&&(identical(other.id, id) || other.id == id)&&(identical(other.region, region) || other.region == region)&&(identical(other.city, city) || other.city == city)&&(identical(other.township, township) || other.township == township)&&(identical(other.streetAddress, streetAddress) || other.streetAddress == streetAddress)&&(identical(other.isDeliveryAddress, isDeliveryAddress) || other.isDeliveryAddress == isDeliveryAddress)&&(identical(other.isPrimaryAddress, isPrimaryAddress) || other.isPrimaryAddress == isPrimaryAddress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,region,city,township,streetAddress,isDeliveryAddress,isPrimaryAddress);

@override
String toString() {
  return 'AddressDto(id: $id, region: $region, city: $city, township: $township, streetAddress: $streetAddress, isDeliveryAddress: $isDeliveryAddress, isPrimaryAddress: $isPrimaryAddress)';
}


}

/// @nodoc
abstract mixin class $AddressDtoCopyWith<$Res>  {
  factory $AddressDtoCopyWith(AddressDto value, $Res Function(AddressDto) _then) = _$AddressDtoCopyWithImpl;
@useResult
$Res call({
 int id, int region, int city, int township,@JsonKey(name: 'street_address') String streetAddress,@JsonKey(name: 'is_delivery_address') int isDeliveryAddress,@JsonKey(name: 'is_primary_address') int isPrimaryAddress
});




}
/// @nodoc
class _$AddressDtoCopyWithImpl<$Res>
    implements $AddressDtoCopyWith<$Res> {
  _$AddressDtoCopyWithImpl(this._self, this._then);

  final AddressDto _self;
  final $Res Function(AddressDto) _then;

/// Create a copy of AddressDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? region = null,Object? city = null,Object? township = null,Object? streetAddress = null,Object? isDeliveryAddress = null,Object? isPrimaryAddress = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as int,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as int,township: null == township ? _self.township : township // ignore: cast_nullable_to_non_nullable
as int,streetAddress: null == streetAddress ? _self.streetAddress : streetAddress // ignore: cast_nullable_to_non_nullable
as String,isDeliveryAddress: null == isDeliveryAddress ? _self.isDeliveryAddress : isDeliveryAddress // ignore: cast_nullable_to_non_nullable
as int,isPrimaryAddress: null == isPrimaryAddress ? _self.isPrimaryAddress : isPrimaryAddress // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _AddressDto implements AddressDto {
  const _AddressDto({required this.id, required this.region, required this.city, required this.township, @JsonKey(name: 'street_address') required this.streetAddress, @JsonKey(name: 'is_delivery_address') required this.isDeliveryAddress, @JsonKey(name: 'is_primary_address') required this.isPrimaryAddress});
  factory _AddressDto.fromJson(Map<String, dynamic> json) => _$AddressDtoFromJson(json);

@override final  int id;
@override final  int region;
@override final  int city;
@override final  int township;
@override@JsonKey(name: 'street_address') final  String streetAddress;
@override@JsonKey(name: 'is_delivery_address') final  int isDeliveryAddress;
@override@JsonKey(name: 'is_primary_address') final  int isPrimaryAddress;

/// Create a copy of AddressDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddressDtoCopyWith<_AddressDto> get copyWith => __$AddressDtoCopyWithImpl<_AddressDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddressDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddressDto&&(identical(other.id, id) || other.id == id)&&(identical(other.region, region) || other.region == region)&&(identical(other.city, city) || other.city == city)&&(identical(other.township, township) || other.township == township)&&(identical(other.streetAddress, streetAddress) || other.streetAddress == streetAddress)&&(identical(other.isDeliveryAddress, isDeliveryAddress) || other.isDeliveryAddress == isDeliveryAddress)&&(identical(other.isPrimaryAddress, isPrimaryAddress) || other.isPrimaryAddress == isPrimaryAddress));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,region,city,township,streetAddress,isDeliveryAddress,isPrimaryAddress);

@override
String toString() {
  return 'AddressDto(id: $id, region: $region, city: $city, township: $township, streetAddress: $streetAddress, isDeliveryAddress: $isDeliveryAddress, isPrimaryAddress: $isPrimaryAddress)';
}


}

/// @nodoc
abstract mixin class _$AddressDtoCopyWith<$Res> implements $AddressDtoCopyWith<$Res> {
  factory _$AddressDtoCopyWith(_AddressDto value, $Res Function(_AddressDto) _then) = __$AddressDtoCopyWithImpl;
@override @useResult
$Res call({
 int id, int region, int city, int township,@JsonKey(name: 'street_address') String streetAddress,@JsonKey(name: 'is_delivery_address') int isDeliveryAddress,@JsonKey(name: 'is_primary_address') int isPrimaryAddress
});




}
/// @nodoc
class __$AddressDtoCopyWithImpl<$Res>
    implements _$AddressDtoCopyWith<$Res> {
  __$AddressDtoCopyWithImpl(this._self, this._then);

  final _AddressDto _self;
  final $Res Function(_AddressDto) _then;

/// Create a copy of AddressDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? region = null,Object? city = null,Object? township = null,Object? streetAddress = null,Object? isDeliveryAddress = null,Object? isPrimaryAddress = null,}) {
  return _then(_AddressDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,region: null == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as int,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as int,township: null == township ? _self.township : township // ignore: cast_nullable_to_non_nullable
as int,streetAddress: null == streetAddress ? _self.streetAddress : streetAddress // ignore: cast_nullable_to_non_nullable
as String,isDeliveryAddress: null == isDeliveryAddress ? _self.isDeliveryAddress : isDeliveryAddress // ignore: cast_nullable_to_non_nullable
as int,isPrimaryAddress: null == isPrimaryAddress ? _self.isPrimaryAddress : isPrimaryAddress // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
