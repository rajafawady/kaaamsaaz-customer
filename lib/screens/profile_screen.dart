import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Back", style: TextStyle(color: Colors.black)),
        leading: Icon(Icons.arrow_back, color: Colors.black),
        backgroundColor: const Color(0xFF16423C),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile Card
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF6A9C89).withOpacity(0.1), // Secondary color
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey.shade300,
                    child: Icon(Icons.person,
                        size: 40, color: Colors.grey.shade600),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Name",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text("+920000000000", style: TextStyle(color: Colors.grey)),
                  Text("hira@butt.pro", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            SizedBox(height: 24),

            // Menu Options
            _menuOption(Icons.person, "My Profile", () {
              // Navigate to My Profile screen
            }),
            SizedBox(height: 12),
            _menuOption(Icons.track_changes, "Tracking", () {
              // Navigate to Tracking screen
            }),
            SizedBox(height: 12),
            _menuOption(Icons.book, "My Bookings", () {
              // Navigate to My Bookings screen
            }),
            SizedBox(height: 12),
            _menuOption(Icons.notifications, "Notifications", () {
              // Navigate to Notifications screen
            }),
            SizedBox(height: 12),
            _menuOption(Icons.help, "Get Help", () {
              // Navigate to Help screen
            }),
          ],
        ),
      ),
    );
  }

  Widget _menuOption(IconData icon, String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF6A9C89).withOpacity(0.1), // Secondary color
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(icon, color: Color(0xFF16423C)), // Primary color
            SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
