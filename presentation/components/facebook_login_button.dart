import 'package:flutter/material.dart';
import 'package:joy_app/gen/assets.gen.dart';
import 'package:joy_app/l10n/generated/app_localizations.dart';

class FacebookLoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? text; // Optional text for the button

  const FacebookLoginButton({
    Key? key,
    required this.onPressed,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    return OutlinedButton.icon(
      icon: Assets.icons.facebook.image(width: 24, height: 24),
      label: Text(locale.loginWithFacebook),
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
    );
  }
}
