import 'package:e_commerce/theme/theme.dart';
import 'package:e_commerce/view/screen/forget_email_screen.dart';
import 'package:e_commerce/view/screen/forget_password_screen.dart';
import 'package:e_commerce/view/screen/otp_verification_screen.dart';
import 'package:e_commerce/view/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShopEase',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.LightTheme,
      home: ForgetPasswordScreen(),
    );
  }
}
