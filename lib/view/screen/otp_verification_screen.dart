import 'package:e_commerce/theme/theme.dart';
import 'package:e_commerce/view/widget/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final int otpLenght = 6;
  final List<TextEditingController> _controller = [];
  final List<FocusNode> _focusNode = [];

  bool _isVreifying = false;
  int _resendTimer = 30;
  bool _canResend = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < otpLenght; i++) {
      _controller.add(TextEditingController());
      _focusNode.add(FocusNode());
    }
    _starResendTimer();
  }

  void _starResendTimer() {
    Future.delayed(Duration(seconds: 1), () {
      if (!mounted) return;
      setState(() {
        if (_resendTimer > 0) {
          _resendTimer--;
          _starResendTimer();
        } else {
          _canResend = true;
        }
      });
    });
  }

  void _verifyOtp() {
    String otp = _controller.map((contrller) => contrller.text).join();
    if (otp.length == otpLenght) {
      setState(() => _isVreifying = true);
      Future.delayed(Duration(seconds: 2), () {
        if (!mounted) return;
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    for (var controller in _controller) {
      controller.dispose();
    }
    for (var node in _focusNode) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.canPop(context);
              },
              icon: Icon(Icons.arrow_back, color: AppTheme.textPrimary))),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Verify Phone",
                  style: Theme.of(context).textTheme.displayLarge),
              SizedBox(height: 8),
              Text(
                "Enter 6-digit code send to +123 456 789 000",
                style: TextStyle(
                  color: AppTheme.TextSecondry,
                ),
              ),
              SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  otpLenght,
                  (index) => SizedBox(
                    width: 50,
                    child: TextField(
                      controller: _controller[index],
                      focusNode: _focusNode[index],
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      style: TextStyle(fontSize: 24),
                      decoration: InputDecoration(
                        counterText: "",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: AppTheme.TextSecondry.withOpacity(0.3),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                              color: AppTheme.primaryColor, width: 2),
                        ),
                      ),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          if (index < otpLenght - 1) {
                            _focusNode[index + 1].requestFocus();
                          } else {
                            _focusNode[index].unfocus();
                          }
                        } else if (index > 0) {
                          _focusNode[index - 1].requestFocus();
                        }
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32),
              GradientButton(
                  text: _isVreifying ? "Verifying..." : "Verify",
                  onPressed: () {
                    if (!_isVreifying) {
                      _verifyOtp();
                    }
                  }),
              SizedBox(height: 24),
              Center(
                child: Column(
                  children: [
                    Text("Didn't receive the code?",
                        style: TextStyle(
                            fontSize: 14, color: AppTheme.TextSecondry)),
                    SizedBox(height: 8),
                    TextButton(
                        onPressed: _canResend
                            ? () {
                                setState(() {
                                  _canResend = false;
                                  _resendTimer = 30;
                                });
                                _starResendTimer();
                              }
                            : null,
                        child: Text(
                          _canResend
                              ? "Resend Code"
                              : "Resend Code in ${_resendTimer}",
                          style: TextStyle(
                              color: _canResend
                                  ? AppTheme.primaryColor
                                  : AppTheme.TextSecondry,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
