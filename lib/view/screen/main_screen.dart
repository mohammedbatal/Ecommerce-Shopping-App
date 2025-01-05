import 'package:e_commerce/theme/theme.dart';
import 'package:e_commerce/view/screen/cart_screen.dart';
import 'package:e_commerce/view/screen/chat_screen.dart';
import 'package:e_commerce/view/screen/home_screen.dart';
import 'package:e_commerce/view/screen/profile_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    ChatScreen(),
    CartScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 20,
                offset: Offset(0, -5)),
          ],
        ),
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Row(
              // _buildNavItem(1, Icons.chat_outlined, Icons.chat, 'Chat'),
              // _buildNavItem(
              // 1, Icons.favorite_outline, Icons.favorite, 'WishList'),
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(0, Icons.home_outlined, Icons.home, 'Home'),
                _buildNavItem(1, Icons.chat_outlined, Icons.chat, 'Chat'),
                _buildCarNavItem(),
                _buildNavItem(3, Icons.person_outline, Icons.person, 'Profile'),

                // _buildNavItem(
                // 3, Icons.shopping_bag_outlined, Icons.shopping_bag, 'Cart'),
              ],
            ),
          ),
        )),
      ),
    );
  }

  Widget _buildNavItem(
      int index, IconData outLinedIcon, IconData filledIcon, String label) {
    bool isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: isSelected
            ? BoxDecoration(
                gradient: LinearGradient(
                    colors: AppTheme.primaryGradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                borderRadius: BorderRadius.circular(12))
            : null,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected ? filledIcon : outLinedIcon,
              color: isSelected ? Colors.white : AppTheme.TextSecondry,
            ),
            SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? Colors.white : AppTheme.TextSecondry,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCarNavItem() {
    bool isSelected = _currentIndex == 2;
    return GestureDetector(
      onTap: () => setState(() => _currentIndex = 2),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: isSelected
            ? BoxDecoration(
                gradient: LinearGradient(
                    colors: AppTheme.primaryGradient,
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                borderRadius: BorderRadius.circular(12))
            : null,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isSelected ? Icons.shopping_bag : Icons.shopping_bag_outlined,
                  color: isSelected ? Colors.white : AppTheme.TextSecondry,
                ),
                SizedBox(height: 4),
                Text(
                  'Cart',
                  style: TextStyle(
                    fontSize: 12,
                    color: isSelected ? Colors.white : AppTheme.TextSecondry,
                    fontWeight:
                        isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
                )
              ],
            ),
            Positioned(
                top: -8,
                right: -8,
                child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: AppTheme.error,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "3",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
