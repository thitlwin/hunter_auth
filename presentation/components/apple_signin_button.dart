// import 'package:flutter/material.dart';
// import 'package:joy_app/gen/assets.gen.dart';
// import 'package:joy_app/l10n/generated/app_localizations.dart';

// class AppleSignInButton extends StatelessWidget {
//   final VoidCallback onPressed;
//   final String? text; // Optional text for the button

//   const AppleSignInButton({
//     Key? key,
//     required this.onPressed,
//     this.text,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final locale = AppLocalizations.of(context);
//     return OutlinedButton.icon(
//       icon: Assets.icons.apple.image(width: 24, height: 24),
//       label: Text(locale.loginWithApple),
//       onPressed: onPressed,
//       style: OutlinedButton.styleFrom(
//         padding: const EdgeInsets.symmetric(vertical: 16),
//       ),
//     );
//   }
// }
