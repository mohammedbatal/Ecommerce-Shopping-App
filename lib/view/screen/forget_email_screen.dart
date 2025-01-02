import 'package:e_commerce/theme/theme.dart';
import 'package:e_commerce/view/widget/custom_text_field.dart';
import 'package:e_commerce/view/widget/gradient_button.dart';
import 'package:flutter/material.dart';

class ForgetEmailScreen extends StatefulWidget {
  const ForgetEmailScreen({super.key});

  @override
  State<ForgetEmailScreen> createState() => _ForgetEmailScreenState();
}

class _ForgetEmailScreenState extends State<ForgetEmailScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _recoveryStarted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back, color: AppTheme.textPrimary))),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Forget Email",
                  style: Theme.of(context).textTheme.displayLarge),
              SizedBox(height: 8),
              Text(
                "Enter your phone number to recover your email address",
                style: TextStyle(color: AppTheme.TextSecondry, fontSize: 16),
              ),
              SizedBox(height: 48),
              if (!_recoveryStarted)
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          label: "Phone Number",
                          prefixIcon: Icons.phone_outlined,
                          keyboardTybe: TextInputType.phone,
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 24),
                        GradientButton(
                            text: 'Recover Email',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  _recoveryStarted = true;
                                });
                              }
                            }),
                        SizedBox(height: 24),
                        Center(
                          child: TextButton(
                              onPressed: () => Navigator.canPop(context),
                              child: Text(
                                "Back to Login",
                                style: TextStyle(
                                    color: AppTheme.primaryColor, fontSize: 16),
                              )),
                        )
                      ],
                    ))
              else
                Center(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            color: AppTheme.success.withOpacity(0.1),
                            shape: BoxShape.circle),
                        child: Icon(
                          Icons.check_circle_outline,
                          size: 40,
                          color: AppTheme.success,
                        ),
                      ),
                      SizedBox(height: 24),
                      Text(
                        "Recovery SMS Sent",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'We have sent your email address to your phone number. Please check your Messages',
                        style: TextStyle(
                            color: AppTheme.TextSecondry,
                            fontSize: 16,
                            height: 1.5),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 32),
                      GradientButton(
                          text: 'Open Messaging App', onPressed: () {}),
                      SizedBox(height: 16),
                      TextButton(
                          onPressed: () => Navigator.canPop(context),
                          child: Text(
                            "Back to Login",
                            style: TextStyle(
                                color: AppTheme.primaryColor, fontSize: 16),
                          )),
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
