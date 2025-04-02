import 'package:flutter/material.dart';

class GoogleLoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String? text; // Optional text for the button

  const GoogleLoginButton({
    Key? key,
    required this.onPressed,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Image.asset(
        'assets/images/ic_google.png',
        height: 30,
      ),
      label: Text(
        text ?? 'Sign in with Google',
        style: TextStyle(
          color: Colors.black87, // Adjust text color as needed
          fontWeight: FontWeight.w500,
        ),
      ),
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        side: BorderSide(color: Colors.grey.shade300), // Light grey border
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // Adjust border radius
        ),
        backgroundColor: Colors.white, // Button background color
        foregroundColor: Colors.black87, // Default text color
      ),
    );
  }
}

// IconButton(
                          //   icon: Image.asset(
                          //     'assets/images/ic_google.png',
                          //     height: 30,
                          //   ), // Replace with your asset path
                          //   onPressed: ref
                          //       .read(authController.notifier)
                          //       .loginWithGoogle,
                          // ),