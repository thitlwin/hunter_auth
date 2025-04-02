import 'package:admin_app/src/feature/hunter_auth/presentation/components/google_login_button.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:admin_app/src/feature/hunter_auth/presentation/provider/hunter_auth_provider.dart';

class HunterAuthScreen extends ConsumerWidget {
  const HunterAuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var authController = hunterAuthProvider;
    final screenWidth = MediaQuery.sizeOf(context).width;
    var isWide = screenWidth > 600; // Tablet/Desktop Layout

    // Adjust padding and form width based on screen size
    final formPadding = screenWidth < 600 ? 16.0 : 32.0;
    final formWidth = screenWidth < 600 ? double.infinity : 600.0;

    return Scaffold(
      backgroundColor: Colors.white, // Assuming a white background
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(formPadding),
              child: Center(
                child: Container(
                  width: formWidth,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      SizedBox(height: 30), // Adjust as needed
                      Image.asset(
                        'assets/images/ic_login_page.png',
                        height: 200, // Adjust as needed
                      ),
                      SizedBox(height: 20), // Adjust as needed
                      Text(
                        'Welcome',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Login to continue',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 40), // Adjust as needed
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Enter your email address',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Enter your password',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            // Handle forgot password
                          },
                          child: Text('Forgot password'),
                        ),
                      ),
                      SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () {
                          // Handle login
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          backgroundColor:
                              Color(0xFF6750A4), // Use your button color
                        ),
                        child: Text('Log in',
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                      ),
                      SizedBox(height: 24),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(child: Divider(thickness: 1)),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text('OR'),
                          ),
                          Expanded(child: Divider(thickness: 1)),
                        ],
                      ),
                      SizedBox(height: 24),
                      GoogleLoginButton(
                          onPressed: () => ref
                              .read(authController.notifier)
                              .loginWithGoogle()),
                      SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Don't have Account?"),
                          TextButton(
                            onPressed: () {
                              // Handle signup
                            },
                            child: Text('Sign up'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
