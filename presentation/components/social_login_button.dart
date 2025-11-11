import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? label; // Optional text for the button
  final Widget icon;
  const SocialLoginButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (label == null) {
      // ✅ Design for null label: Circular icon button
      const double size =
          48.0; // Define a suitable size for the circular button

      return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
          // You can customize the background color here, e.g., using Theme colors or a specific brand color
          // color: Colors.grey.shade200,
        ),
        child: InkWell(
          onTap: onPressed,
          customBorder:
              const CircleBorder(), // Ensures the ripple effect is circular
          child: Center(
            child: icon,
          ),
        ),
      );
    } else
      return OutlinedButton.icon(
        icon: icon,
        label: Text(label!),
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
      );
  }
}
