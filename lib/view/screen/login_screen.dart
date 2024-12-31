import 'package:e_commerce/theme/theme.dart';
import 'package:e_commerce/view/screen/sign_up_screen.dart';
import 'package:e_commerce/view/widget/custom_text_field.dart';
import 'package:e_commerce/view/widget/gradient_button.dart';
import 'package:e_commerce/view/widget/social_login_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: MediaQuery.of(context).size.height * 0.35,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: AppTheme.primaryGradient,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40))),
                ),
              ),
              Stack(
                children: [
                  Positioned(
                    top: -50,
                    right: -50,
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.1),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 48,
                    left: 16,
                    right: 16,
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.arrow_back),
                          onPressed: () => Navigator.pop(context),
                        ),
                        Expanded(
                            child: Center(
                          child: Text(
                            'Welcome Back',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                        )),
                        SizedBox(width: 40),
                      ],
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.15,
                    left: 24,
                    right: 24,
                    child: Container(
                      padding: EdgeInsets.all(24),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 20,
                              offset: Offset(0, 10),
                            ),
                          ]),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Login to your account',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Enter your credentials to continue shopping',
                              style: TextStyle(
                                  fontSize: 14, color: AppTheme.TextSecondry),
                            ),
                            SizedBox(height: 32),
                            CustomTextField(
                              label: 'Email',
                              prefixIcon: Icons.email_outlined,
                              keyboardTybe: TextInputType.emailAddress,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Please entert your email';
                                }
                                if (val.contains('@')) {
                                  return 'Please entert your email';
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 16),
                            CustomTextField(
                              label: 'Password',
                              prefixIcon: Icons.lock_outline,
                              keyboardTybe: TextInputType.visiblePassword,
                              isPassword: true,
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Please entert your Password';
                                }
                                if (val.length < 6) {
                                  return 'Password must be at least 6 characters';
                                }
                                return null;
                              },
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                  onPressed: () {
                                    // Navigator.push(context, MaterialPageRoute
                                    //(builder: (context)=> ForgotPasswordScreen()));
                                  },
                                  style: TextButton.styleFrom(
                                      foregroundColor: AppTheme.primaryColor),
                                  child: Text("Forgot Password")),
                            ),
                            SizedBox(height: 24),
                            GradientButton(
                                text: 'Login',
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    //
                                  }
                                }),
                            SizedBox(height: 24),
                            Center(
                              child: Text(
                                "Or continue with",
                                style: TextStyle(
                                    color: AppTheme.TextSecondry, fontSize: 14),
                              ),
                            ),
                            SizedBox(height: 24),
                            Row(
                              children: [
                                Expanded(
                                  child: SocialLoginButton(
                                      text: 'Google',
                                      iconPath: 'assets/icons/google.png',
                                      onPressed: () {}),
                                ),
                                SizedBox(width: 16),
                                Expanded(
                                  child: SocialLoginButton(
                                      text: 'Apple',
                                      iconPath: 'assets/icons/apple.png',
                                      onPressed: () {}),
                                ),
                              ],
                            ),
                            SizedBox(width: 24),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Don't have an acount?",
                                      style: TextStyle(
                                          color: AppTheme.TextSecondry)),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SignUpScreen()));
                                      },
                                      child: Text("Sign Up"))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
