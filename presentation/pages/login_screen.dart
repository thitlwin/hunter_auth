import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:joy_app/gen/assets.gen.dart';
import 'package:joy_app/l10n/generated/app_localizations.dart';
import 'package:joy_app/src/common_widgets/go_back_button.dart';
import 'package:joy_app/src/common_widgets/screenoverlay_loading_widget.dart';
import 'package:joy_app/src/common_widgets/text_field_widget.dart';
import 'package:joy_app/src/feature/login/presentation/provider/login_screen_notifier.dart';
import 'package:joy_app/l10n/l10n_constants.dart';
import 'package:joy_app/l10n/l10n_helper.dart';
import 'package:joy_app/src/router/app_routes.dart';

class LoginScreen extends StatefulHookConsumerWidget {
  final String? from;
  const LoginScreen({super.key, this.from});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginFormState = ref.watch(loginScreenNotifierProvider);
    final loginFormNotifier = ref.read(loginScreenNotifierProvider.notifier);

    final screenWidth = MediaQuery.sizeOf(context).width;
    final locale = AppLocalizations.of(context);
    final theme = Theme.of(context);

    // Adjust padding and form width based on screen size
    final formPadding = screenWidth < 600 ? 16.0 : 32.0;
    final formWidth = screenWidth < 600 ? double.infinity : 600.0;
    final _obsecurePassword = useState(true);
    return Scaffold(
      backgroundColor: Colors.white, // Assuming a white background
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Assets.images.bgAuth.image(
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            left: formPadding,
            top: 50,
            child: IconButton(
              color: Colors.white,
              icon: const Icon(Icons.arrow_back), // Back button icon
              onPressed: () {
                context.pop();
              },
            ),
          ),
          Center(
            child: LayoutBuilder(
              builder: (context, constraints) => SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(formPadding),
                  width: formWidth,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Padding(
                    padding: EdgeInsets.all(formPadding),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(height: 30), // Adjust as needed
                          Text(
                            locale.welcomeBack,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10), // Adjust as needed
                          Text(
                            locale.loginToYourAccount,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16),
                          ),
                          // SizedBox(height: 30), // Adjust as needed
                          if (!loginFormState.isSuccess &&
                              loginFormState.messageKey != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Center(
                                child: Text(
                                  context.getL10nMessage(
                                          loginFormState.messageKey) ??
                                      '',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: theme.colorScheme.error,
                                  ),
                                ),
                              ),
                            ),

                          const SizedBox(height: 30),
                          buildTextField(
                            label: locale.phoneNumber,
                            keyboardType: TextInputType.phone,
                            controller: phoneController,
                            onChanged: loginFormNotifier.updatePhoneNumber,
                            errorText: context.getL10nMessage(loginFormState
                                .formErrors?[L10nConstants.phone]),
                          ),
                          buildTextField(
                            label: locale.password,
                            obscureText: _obsecurePassword.value,
                            isPassword: true,
                            onToggleVisibility: () => _obsecurePassword.value =
                                !_obsecurePassword.value,
                            controller: passwordController,
                            onChanged: loginFormNotifier.updatePassword,
                            errorText: context.getL10nMessage(loginFormState
                                .formErrors?[L10nConstants.password]),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                ForgotPasswordRoute().push(context);
                              },
                              child: Text(locale.forgotYourPassword),
                            ),
                          ),
                          SizedBox(height: 24),
                          FilledButton(
                            onPressed: () {
                              loginFormNotifier.login(phoneController.text,
                                  passwordController.text);
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 16),
                            ),
                            child: Text(
                              locale.login,
                            ),
                          ),

                          const SizedBox(height: 24),
                          // TODO - to be implemented at v2.0
                          /* Row(
                            children: <Widget>[
                              const Expanded(child: Divider()),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(locale.or.toUpperCase(),
                                    style:
                                        TextStyle(color: Colors.grey.shade600)),
                              ),
                              const Expanded(child: Divider()),
                            ],
                          ),
                          const SizedBox(height: 24),
                          FacebookLoginButton(onPressed: () {
                            loginFormNotifier.loginWithFacebook();
                          }),
                          SizedBox(height: 24), */
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(locale.dontHaveAccount),
                              TextButton(
                                onPressed: () {
                                  RegisterRoute().pushReplacement(context);
                                },
                                child: Text(locale.signUp),
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (loginFormState.isLoading) screenOverlayLoadingWidget()
        ],
      ),
    );
  }
}
