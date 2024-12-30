import 'package:e_commerce/theme/theme.dart';
import 'package:e_commerce/view/screen/welcome_screen.dart';
import 'package:e_commerce/view/widget/gradient_button.dart';
import 'package:flutter/material.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  final PageController _pageController = PageController();

  int _currentPage = 0;
  final List<OnBoardingData> _pages = [
    OnBoardingData(
      title: 'Discover Latest Trends',
      description:
          'Explore our vast collection of trendy and fashionable items curvates just for you',
      image: 'assets/images/onboarding1.png',
    ),
    OnBoardingData(
      title: 'Esay Shopping Experience',
      description:
          'Shop with ease and get your favorite items delivered right to your doorstep ',
      image: 'assets/images/onboarding2.png',
    ),
    OnBoardingData(
      title: 'Secure Payments',
      description:
          'Multiple secure payments option for safe and hassle-free transactions',
      image: 'assets/images/onboarding3.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
                // print(_currentPage);
              });
            },
            itemCount: _pages.length,
            itemBuilder: (context, index) {
              return OnboardingPage(data: _pages[index]);
            },
          ),
          Positioned(
            top: 48,
            right: 24,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WelcomeScreen(),
                  ),
                );
              },
              child: Text(
                "Skip",
                style: TextStyle(
                  color: AppTheme.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 48,
            left: 24,
            right: 24,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      _pages.length,
                      (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            height: 8,
                            width: _currentPage == index ? 24 : 8,
                            decoration: BoxDecoration(
                                color: AppTheme.primaryColor.withOpacity(
                                    _currentPage == index ? 1 : 0.3),
                                borderRadius: BorderRadius.circular(4)),
                          )),
                ),
                SizedBox(height: 32),
                Row(
                  children: [
                    if (_currentPage > 0)
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            _pageController.previousPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                          },
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            side: BorderSide(
                              color: AppTheme.primaryColor,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text(
                            "Previous",
                            style: TextStyle(
                                color: AppTheme.primaryColor, fontSize: 16),
                          ),
                        ),
                      ),
                    if (_currentPage > 0) const SizedBox(width: 16),
                    Expanded(
                      child: GradientButton(
                        text: _currentPage == _pages.length - 1
                            ? 'Get Started'
                            : 'Next',
                        gradient: [
                          AppTheme.primaryColor,
                          AppTheme.primaryColor.withOpacity(0.8)
                        ],
                        onPressed: () {
                          if (_currentPage < _pages.length - 1) {
                            _pageController.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut);
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WelcomeScreen(),
                              ),
                            );
                          }
                        },
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class OnBoardingData {
  final String title;
  final String description;
  final String image;

  OnBoardingData({
    required this.title,
    required this.description,
    required this.image,
  });
}

class OnboardingPage extends StatelessWidget {
  final OnBoardingData data;
  const OnboardingPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            data.image,
            height: MediaQuery.of(context).size.height * 0.4,
          ),
          SizedBox(height: 48),
          Text(
            data.title,
            style: TextStyle(
              color: AppTheme.primaryColor,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16),
          Text(
            data.description,
            style: TextStyle(
              color: AppTheme.TextSecondry,
              fontSize: 16,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
