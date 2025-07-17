import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:joy_app/src/feature/profile/domain/model/joy_user.dart';

part 'login_response.freezed.dart';
part 'login_response.g.dart';

@freezed
abstract class LoginResponse with _$LoginResponse {
  const factory LoginResponse({
    required CustomerDto customer,
    required List<AddressDto>? addresses,
    required String token,
    @JsonKey(name: 'firebase_token') required String firebaseToken,
    required List<dynamic> vouchers, // Assuming vouchers can be any type
  }) = _LoginResponse;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

@freezed
abstract class CustomerDto with _$CustomerDto {
  const factory CustomerDto({
    required int id,
    required String? name,
    required String? phone,
    required String? nrc,
    @JsonKey(name: 'profile_picture') required String? profilePicture,
    required String? dob,
    required int? weight,
    required int? feet,
    required int? inches,
    required double? bmi,
    @JsonKey(name: 'facebook_id') String? facebookId,
    @JsonKey(name: 'apple_id') String? appleId,
  }) = _CustomerDto;

  factory CustomerDto.fromJson(Map<String, dynamic> json) =>
      _$CustomerDtoFromJson(json);
}

@freezed
abstract class AddressDto with _$AddressDto {
  const factory AddressDto({
    required int id,
    required int region,
    required int city,
    required int township,
    @JsonKey(name: 'street_address') required String streetAddress,
    @JsonKey(name: 'is_delivery_address') required int isDeliveryAddress,
    @JsonKey(name: 'is_primary_address') required int isPrimaryAddress,
  }) = _AddressDto;

  factory AddressDto.fromJson(Map<String, dynamic> json) =>
      _$AddressDtoFromJson(json);
}

extension LoginResponseX on LoginResponse {
  JoyUser toAuthDomainModel() {
    return JoyUser(
      id: customer.id,
      name: customer.name,
      profilePicture: customer.profilePicture,
      phone: customer.phone,
      nrc: customer.nrc,
      dob: customer.dob,
      weight: customer.weight?.toDouble(),
      feet: customer.feet?.toDouble(),
      inches: customer.inches?.toDouble(),
      bmi: customer.bmi,
      facebookId:
          customer.facebookId != null ? customer.facebookId.toString() : null,
      appleId: customer.appleId,
      gender: null, // Replace with actual value if available
      activePlan: null, // Replace with actual value if available
      acitveChallenge: null, // Replace with actual value if available
      currentPoints: null, // Replace with actual value if available
      memberLevel: null, // Replace with actual value if available
      nextLevel: null, // Replace with actual value if available
      pointsExpireAt: null, // Replace with actual value if available
      weightUpdatedAt: null, // Replace with actual value if available
      paymentMethodId: null, // Replace with actual value if available
      goalId: null, // Replace with actual value if available
      addresses: [], // Replace with actual value if available
      customerChatUnreadCount: null, // Replace with actual value if available
    );
  }
}

extension CustomerX on CustomerDto {
  JoyUser toAuthDomainModel() {
    return JoyUser(
      id: id,
      name: name ?? "",
      profilePicture: profilePicture,
      phone: phone ?? "",
      nrc: nrc,
      dob: dob,
      weight: weight?.toDouble(),
      feet: feet?.toDouble(),
      inches: inches?.toDouble(),
      bmi: bmi,
      facebookId: facebookId != null ? facebookId.toString() : null,
      appleId: appleId,
    );
  }
}
