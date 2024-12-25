import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavBar extends StatelessWidget {
  final Widget child;

  const CustomBottomNavBar({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(top: 10), // Add spacing at the top
        decoration: const BoxDecoration(
          color: Colors.white, // Background color
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(context, Icons.home, '/home', 0),
            _buildNavItem(context, Icons.note, '/notes', 1),
            _buildCenterItem(context, Icons.shopping_cart, '/shop', 2),
            _buildNavItem(context, Icons.chat, '/chat', 3),
            _buildNavItem(context, Icons.person, '/profile', 4),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
      BuildContext context, IconData icon, String route, int index) {
    final currentIndex = _getSelectedIndex(context);
    return IconButton(
      onPressed: () => _onItemTapped(context, index),
      icon: Icon(
        icon,
        size: 28,
        color: currentIndex == index ? Colors.black : Colors.grey,
      ),
    );
  }

  Widget _buildCenterItem(
      BuildContext context, IconData icon, String route, int index) {
    return GestureDetector(
      onTap: () => _onItemTapped(context, index),
      child: CircleAvatar(
        radius: 30, // Circle size
        backgroundColor: const Color(0xFF4E6E68), // Custom green color
        child: Icon(
          icon,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }

  int _getSelectedIndex(BuildContext context) {
    final location =
        GoRouter.of(context).routerDelegate.currentConfiguration.fullPath;
    if (location.startsWith('/notes')) return 1;
    if (location.startsWith('/shop')) return 2;
    if (location.startsWith('/chat')) return 3;
    if (location.startsWith('/profile')) return 4;
    return 0; // Default to Home
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/notes');
        break;
      case 2:
        context.go('/shop');
        break;
      case 3:
        context.go('/chat');
        break;
      case 4:
        context.go('/profile');
        break;
    }
  }
}
