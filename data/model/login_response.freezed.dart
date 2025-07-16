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
mixin _$LoginResponse {
  CustomerDto get customer;
  List<AddressDto>? get addresses;
  String get token;
  @JsonKey(name: 'firebase_token')
  String get firebaseToken;
  List<dynamic> get vouchers;

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoginResponseCopyWith<LoginResponse> get copyWith =>
      _$LoginResponseCopyWithImpl<LoginResponse>(
          this as LoginResponse, _$identity);

  /// Serializes this LoginResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginResponse &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            const DeepCollectionEquality().equals(other.addresses, addresses) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.firebaseToken, firebaseToken) ||
                other.firebaseToken == firebaseToken) &&
            const DeepCollectionEquality().equals(other.vouchers, vouchers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      customer,
      const DeepCollectionEquality().hash(addresses),
      token,
      firebaseToken,
      const DeepCollectionEquality().hash(vouchers));

  @override
  String toString() {
    return 'LoginResponse(customer: $customer, addresses: $addresses, token: $token, firebaseToken: $firebaseToken, vouchers: $vouchers)';
  }
}

/// @nodoc
abstract mixin class $LoginResponseCopyWith<$Res> {
  factory $LoginResponseCopyWith(
          LoginResponse value, $Res Function(LoginResponse) _then) =
      _$LoginResponseCopyWithImpl;
  @useResult
  $Res call(
      {CustomerDto customer,
      List<AddressDto>? addresses,
      String token,
      @JsonKey(name: 'firebase_token') String firebaseToken,
      List<dynamic> vouchers});

  $CustomerDtoCopyWith<$Res> get customer;
}

/// @nodoc
class _$LoginResponseCopyWithImpl<$Res>
    implements $LoginResponseCopyWith<$Res> {
  _$LoginResponseCopyWithImpl(this._self, this._then);

  final LoginResponse _self;
  final $Res Function(LoginResponse) _then;

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customer = null,
    Object? addresses = freezed,
    Object? token = null,
    Object? firebaseToken = null,
    Object? vouchers = null,
  }) {
    return _then(_self.copyWith(
      customer: null == customer
          ? _self.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as CustomerDto,
      addresses: freezed == addresses
          ? _self.addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<AddressDto>?,
      token: null == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      firebaseToken: null == firebaseToken
          ? _self.firebaseToken
          : firebaseToken // ignore: cast_nullable_to_non_nullable
              as String,
      vouchers: null == vouchers
          ? _self.vouchers
          : vouchers // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerDtoCopyWith<$Res> get customer {
    return $CustomerDtoCopyWith<$Res>(_self.customer, (value) {
      return _then(_self.copyWith(customer: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _LoginResponse implements LoginResponse {
  const _LoginResponse(
      {required this.customer,
      required final List<AddressDto>? addresses,
      required this.token,
      @JsonKey(name: 'firebase_token') required this.firebaseToken,
      required final List<dynamic> vouchers})
      : _addresses = addresses,
        _vouchers = vouchers;
  factory _LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  @override
  final CustomerDto customer;
  final List<AddressDto>? _addresses;
  @override
  List<AddressDto>? get addresses {
    final value = _addresses;
    if (value == null) return null;
    if (_addresses is EqualUnmodifiableListView) return _addresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String token;
  @override
  @JsonKey(name: 'firebase_token')
  final String firebaseToken;
  final List<dynamic> _vouchers;
  @override
  List<dynamic> get vouchers {
    if (_vouchers is EqualUnmodifiableListView) return _vouchers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_vouchers);
  }

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoginResponseCopyWith<_LoginResponse> get copyWith =>
      __$LoginResponseCopyWithImpl<_LoginResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LoginResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginResponse &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            const DeepCollectionEquality()
                .equals(other._addresses, _addresses) &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.firebaseToken, firebaseToken) ||
                other.firebaseToken == firebaseToken) &&
            const DeepCollectionEquality().equals(other._vouchers, _vouchers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      customer,
      const DeepCollectionEquality().hash(_addresses),
      token,
      firebaseToken,
      const DeepCollectionEquality().hash(_vouchers));

  @override
  String toString() {
    return 'LoginResponse(customer: $customer, addresses: $addresses, token: $token, firebaseToken: $firebaseToken, vouchers: $vouchers)';
  }
}

/// @nodoc
abstract mixin class _$LoginResponseCopyWith<$Res>
    implements $LoginResponseCopyWith<$Res> {
  factory _$LoginResponseCopyWith(
          _LoginResponse value, $Res Function(_LoginResponse) _then) =
      __$LoginResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {CustomerDto customer,
      List<AddressDto>? addresses,
      String token,
      @JsonKey(name: 'firebase_token') String firebaseToken,
      List<dynamic> vouchers});

  @override
  $CustomerDtoCopyWith<$Res> get customer;
}

/// @nodoc
class __$LoginResponseCopyWithImpl<$Res>
    implements _$LoginResponseCopyWith<$Res> {
  __$LoginResponseCopyWithImpl(this._self, this._then);

  final _LoginResponse _self;
  final $Res Function(_LoginResponse) _then;

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? customer = null,
    Object? addresses = freezed,
    Object? token = null,
    Object? firebaseToken = null,
    Object? vouchers = null,
  }) {
    return _then(_LoginResponse(
      customer: null == customer
          ? _self.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as CustomerDto,
      addresses: freezed == addresses
          ? _self._addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<AddressDto>?,
      token: null == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
      firebaseToken: null == firebaseToken
          ? _self.firebaseToken
          : firebaseToken // ignore: cast_nullable_to_non_nullable
              as String,
      vouchers: null == vouchers
          ? _self._vouchers
          : vouchers // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }

  /// Create a copy of LoginResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerDtoCopyWith<$Res> get customer {
    return $CustomerDtoCopyWith<$Res>(_self.customer, (value) {
      return _then(_self.copyWith(customer: value));
    });
  }
}

/// @nodoc
mixin _$CustomerDto {
  int get id;
  String? get name;
  String? get phone;
  String? get nrc;
  @JsonKey(name: 'profile_picture')
  String? get profilePicture;
  String? get dob;
  int? get weight;
  int? get feet;
  int? get inches;
  double? get bmi;
  @JsonKey(name: 'facebook_id')
  String? get facebookId;
  @JsonKey(name: 'apple_id')
  String? get appleId;

  /// Create a copy of CustomerDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CustomerDtoCopyWith<CustomerDto> get copyWith =>
      _$CustomerDtoCopyWithImpl<CustomerDto>(this as CustomerDto, _$identity);

  /// Serializes this CustomerDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CustomerDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.nrc, nrc) || other.nrc == nrc) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.feet, feet) || other.feet == feet) &&
            (identical(other.inches, inches) || other.inches == inches) &&
            (identical(other.bmi, bmi) || other.bmi == bmi) &&
            (identical(other.facebookId, facebookId) ||
                other.facebookId == facebookId) &&
            (identical(other.appleId, appleId) || other.appleId == appleId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, phone, nrc,
      profilePicture, dob, weight, feet, inches, bmi, facebookId, appleId);

  @override
  String toString() {
    return 'CustomerDto(id: $id, name: $name, phone: $phone, nrc: $nrc, profilePicture: $profilePicture, dob: $dob, weight: $weight, feet: $feet, inches: $inches, bmi: $bmi, facebookId: $facebookId, appleId: $appleId)';
  }
}

/// @nodoc
abstract mixin class $CustomerDtoCopyWith<$Res> {
  factory $CustomerDtoCopyWith(
          CustomerDto value, $Res Function(CustomerDto) _then) =
      _$CustomerDtoCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String? name,
      String? phone,
      String? nrc,
      @JsonKey(name: 'profile_picture') String? profilePicture,
      String? dob,
      int? weight,
      int? feet,
      int? inches,
      double? bmi,
      @JsonKey(name: 'facebook_id') String? facebookId,
      @JsonKey(name: 'apple_id') String? appleId});
}

/// @nodoc
class _$CustomerDtoCopyWithImpl<$Res> implements $CustomerDtoCopyWith<$Res> {
  _$CustomerDtoCopyWithImpl(this._self, this._then);

  final CustomerDto _self;
  final $Res Function(CustomerDto) _then;

  /// Create a copy of CustomerDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? phone = freezed,
    Object? nrc = freezed,
    Object? profilePicture = freezed,
    Object? dob = freezed,
    Object? weight = freezed,
    Object? feet = freezed,
    Object? inches = freezed,
    Object? bmi = freezed,
    Object? facebookId = freezed,
    Object? appleId = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      nrc: freezed == nrc
          ? _self.nrc
          : nrc // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: freezed == profilePicture
          ? _self.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _self.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: freezed == weight
          ? _self.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int?,
      feet: freezed == feet
          ? _self.feet
          : feet // ignore: cast_nullable_to_non_nullable
              as int?,
      inches: freezed == inches
          ? _self.inches
          : inches // ignore: cast_nullable_to_non_nullable
              as int?,
      bmi: freezed == bmi
          ? _self.bmi
          : bmi // ignore: cast_nullable_to_non_nullable
              as double?,
      facebookId: freezed == facebookId
          ? _self.facebookId
          : facebookId // ignore: cast_nullable_to_non_nullable
              as String?,
      appleId: freezed == appleId
          ? _self.appleId
          : appleId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CustomerDto implements CustomerDto {
  const _CustomerDto(
      {required this.id,
      required this.name,
      required this.phone,
      required this.nrc,
      @JsonKey(name: 'profile_picture') required this.profilePicture,
      required this.dob,
      required this.weight,
      required this.feet,
      required this.inches,
      required this.bmi,
      @JsonKey(name: 'facebook_id') this.facebookId,
      @JsonKey(name: 'apple_id') this.appleId});
  factory _CustomerDto.fromJson(Map<String, dynamic> json) =>
      _$CustomerDtoFromJson(json);

  @override
  final int id;
  @override
  final String? name;
  @override
  final String? phone;
  @override
  final String? nrc;
  @override
  @JsonKey(name: 'profile_picture')
  final String? profilePicture;
  @override
  final String? dob;
  @override
  final int? weight;
  @override
  final int? feet;
  @override
  final int? inches;
  @override
  final double? bmi;
  @override
  @JsonKey(name: 'facebook_id')
  final String? facebookId;
  @override
  @JsonKey(name: 'apple_id')
  final String? appleId;

  /// Create a copy of CustomerDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CustomerDtoCopyWith<_CustomerDto> get copyWith =>
      __$CustomerDtoCopyWithImpl<_CustomerDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CustomerDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CustomerDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.nrc, nrc) || other.nrc == nrc) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture) &&
            (identical(other.dob, dob) || other.dob == dob) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.feet, feet) || other.feet == feet) &&
            (identical(other.inches, inches) || other.inches == inches) &&
            (identical(other.bmi, bmi) || other.bmi == bmi) &&
            (identical(other.facebookId, facebookId) ||
                other.facebookId == facebookId) &&
            (identical(other.appleId, appleId) || other.appleId == appleId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, phone, nrc,
      profilePicture, dob, weight, feet, inches, bmi, facebookId, appleId);

  @override
  String toString() {
    return 'CustomerDto(id: $id, name: $name, phone: $phone, nrc: $nrc, profilePicture: $profilePicture, dob: $dob, weight: $weight, feet: $feet, inches: $inches, bmi: $bmi, facebookId: $facebookId, appleId: $appleId)';
  }
}

/// @nodoc
abstract mixin class _$CustomerDtoCopyWith<$Res>
    implements $CustomerDtoCopyWith<$Res> {
  factory _$CustomerDtoCopyWith(
          _CustomerDto value, $Res Function(_CustomerDto) _then) =
      __$CustomerDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      String? name,
      String? phone,
      String? nrc,
      @JsonKey(name: 'profile_picture') String? profilePicture,
      String? dob,
      int? weight,
      int? feet,
      int? inches,
      double? bmi,
      @JsonKey(name: 'facebook_id') String? facebookId,
      @JsonKey(name: 'apple_id') String? appleId});
}

/// @nodoc
class __$CustomerDtoCopyWithImpl<$Res> implements _$CustomerDtoCopyWith<$Res> {
  __$CustomerDtoCopyWithImpl(this._self, this._then);

  final _CustomerDto _self;
  final $Res Function(_CustomerDto) _then;

  /// Create a copy of CustomerDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? phone = freezed,
    Object? nrc = freezed,
    Object? profilePicture = freezed,
    Object? dob = freezed,
    Object? weight = freezed,
    Object? feet = freezed,
    Object? inches = freezed,
    Object? bmi = freezed,
    Object? facebookId = freezed,
    Object? appleId = freezed,
  }) {
    return _then(_CustomerDto(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      phone: freezed == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String?,
      nrc: freezed == nrc
          ? _self.nrc
          : nrc // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePicture: freezed == profilePicture
          ? _self.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String?,
      dob: freezed == dob
          ? _self.dob
          : dob // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: freezed == weight
          ? _self.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int?,
      feet: freezed == feet
          ? _self.feet
          : feet // ignore: cast_nullable_to_non_nullable
              as int?,
      inches: freezed == inches
          ? _self.inches
          : inches // ignore: cast_nullable_to_non_nullable
              as int?,
      bmi: freezed == bmi
          ? _self.bmi
          : bmi // ignore: cast_nullable_to_non_nullable
              as double?,
      facebookId: freezed == facebookId
          ? _self.facebookId
          : facebookId // ignore: cast_nullable_to_non_nullable
              as String?,
      appleId: freezed == appleId
          ? _self.appleId
          : appleId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$AddressDto {
  int get id;
  int get region;
  int get city;
  int get township;
  @JsonKey(name: 'street_address')
  String get streetAddress;
  @JsonKey(name: 'is_delivery_address')
  int get isDeliveryAddress;
  @JsonKey(name: 'is_primary_address')
  int get isPrimaryAddress;

  /// Create a copy of AddressDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddressDtoCopyWith<AddressDto> get copyWith =>
      _$AddressDtoCopyWithImpl<AddressDto>(this as AddressDto, _$identity);

  /// Serializes this AddressDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddressDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.township, township) ||
                other.township == township) &&
            (identical(other.streetAddress, streetAddress) ||
                other.streetAddress == streetAddress) &&
            (identical(other.isDeliveryAddress, isDeliveryAddress) ||
                other.isDeliveryAddress == isDeliveryAddress) &&
            (identical(other.isPrimaryAddress, isPrimaryAddress) ||
                other.isPrimaryAddress == isPrimaryAddress));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, region, city, township,
      streetAddress, isDeliveryAddress, isPrimaryAddress);

  @override
  String toString() {
    return 'AddressDto(id: $id, region: $region, city: $city, township: $township, streetAddress: $streetAddress, isDeliveryAddress: $isDeliveryAddress, isPrimaryAddress: $isPrimaryAddress)';
  }
}

/// @nodoc
abstract mixin class $AddressDtoCopyWith<$Res> {
  factory $AddressDtoCopyWith(
          AddressDto value, $Res Function(AddressDto) _then) =
      _$AddressDtoCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      int region,
      int city,
      int township,
      @JsonKey(name: 'street_address') String streetAddress,
      @JsonKey(name: 'is_delivery_address') int isDeliveryAddress,
      @JsonKey(name: 'is_primary_address') int isPrimaryAddress});
}

/// @nodoc
class _$AddressDtoCopyWithImpl<$Res> implements $AddressDtoCopyWith<$Res> {
  _$AddressDtoCopyWithImpl(this._self, this._then);

  final AddressDto _self;
  final $Res Function(AddressDto) _then;

  /// Create a copy of AddressDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? region = null,
    Object? city = null,
    Object? township = null,
    Object? streetAddress = null,
    Object? isDeliveryAddress = null,
    Object? isPrimaryAddress = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      region: null == region
          ? _self.region
          : region // ignore: cast_nullable_to_non_nullable
              as int,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as int,
      township: null == township
          ? _self.township
          : township // ignore: cast_nullable_to_non_nullable
              as int,
      streetAddress: null == streetAddress
          ? _self.streetAddress
          : streetAddress // ignore: cast_nullable_to_non_nullable
              as String,
      isDeliveryAddress: null == isDeliveryAddress
          ? _self.isDeliveryAddress
          : isDeliveryAddress // ignore: cast_nullable_to_non_nullable
              as int,
      isPrimaryAddress: null == isPrimaryAddress
          ? _self.isPrimaryAddress
          : isPrimaryAddress // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _AddressDto implements AddressDto {
  const _AddressDto(
      {required this.id,
      required this.region,
      required this.city,
      required this.township,
      @JsonKey(name: 'street_address') required this.streetAddress,
      @JsonKey(name: 'is_delivery_address') required this.isDeliveryAddress,
      @JsonKey(name: 'is_primary_address') required this.isPrimaryAddress});
  factory _AddressDto.fromJson(Map<String, dynamic> json) =>
      _$AddressDtoFromJson(json);

  @override
  final int id;
  @override
  final int region;
  @override
  final int city;
  @override
  final int township;
  @override
  @JsonKey(name: 'street_address')
  final String streetAddress;
  @override
  @JsonKey(name: 'is_delivery_address')
  final int isDeliveryAddress;
  @override
  @JsonKey(name: 'is_primary_address')
  final int isPrimaryAddress;

  /// Create a copy of AddressDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddressDtoCopyWith<_AddressDto> get copyWith =>
      __$AddressDtoCopyWithImpl<_AddressDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AddressDtoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddressDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.region, region) || other.region == region) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.township, township) ||
                other.township == township) &&
            (identical(other.streetAddress, streetAddress) ||
                other.streetAddress == streetAddress) &&
            (identical(other.isDeliveryAddress, isDeliveryAddress) ||
                other.isDeliveryAddress == isDeliveryAddress) &&
            (identical(other.isPrimaryAddress, isPrimaryAddress) ||
                other.isPrimaryAddress == isPrimaryAddress));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, region, city, township,
      streetAddress, isDeliveryAddress, isPrimaryAddress);

  @override
  String toString() {
    return 'AddressDto(id: $id, region: $region, city: $city, township: $township, streetAddress: $streetAddress, isDeliveryAddress: $isDeliveryAddress, isPrimaryAddress: $isPrimaryAddress)';
  }
}

/// @nodoc
abstract mixin class _$AddressDtoCopyWith<$Res>
    implements $AddressDtoCopyWith<$Res> {
  factory _$AddressDtoCopyWith(
          _AddressDto value, $Res Function(_AddressDto) _then) =
      __$AddressDtoCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int id,
      int region,
      int city,
      int township,
      @JsonKey(name: 'street_address') String streetAddress,
      @JsonKey(name: 'is_delivery_address') int isDeliveryAddress,
      @JsonKey(name: 'is_primary_address') int isPrimaryAddress});
}

/// @nodoc
class __$AddressDtoCopyWithImpl<$Res> implements _$AddressDtoCopyWith<$Res> {
  __$AddressDtoCopyWithImpl(this._self, this._then);

  final _AddressDto _self;
  final $Res Function(_AddressDto) _then;

  /// Create a copy of AddressDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? region = null,
    Object? city = null,
    Object? township = null,
    Object? streetAddress = null,
    Object? isDeliveryAddress = null,
    Object? isPrimaryAddress = null,
  }) {
    return _then(_AddressDto(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      region: null == region
          ? _self.region
          : region // ignore: cast_nullable_to_non_nullable
              as int,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as int,
      township: null == township
          ? _self.township
          : township // ignore: cast_nullable_to_non_nullable
              as int,
      streetAddress: null == streetAddress
          ? _self.streetAddress
          : streetAddress // ignore: cast_nullable_to_non_nullable
              as String,
      isDeliveryAddress: null == isDeliveryAddress
          ? _self.isDeliveryAddress
          : isDeliveryAddress // ignore: cast_nullable_to_non_nullable
              as int,
      isPrimaryAddress: null == isPrimaryAddress
          ? _self.isPrimaryAddress
          : isPrimaryAddress // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
