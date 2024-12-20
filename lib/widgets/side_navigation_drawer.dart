import 'package:flutter/material.dart';
import '../screens/settings_screen.dart';
import '../screens/about_screen.dart';

class SideNavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF001F54), // Dark navy blue at the top-left
              Color(0xFFF0F1E1), // Light beige color in the center
              Color(0xFF001F54), // Dark navy blue at the bottom-right
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Use a SingleChildScrollView to ensure scrolling when content overflows
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.transparent),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // Center everything vertically
                  crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally
                  children: [
                    // Profile Picture
                    CircleAvatar(
                      radius: 40, // Set the profile picture size
                      backgroundImage: AssetImage('assets/profile_picture.png'), // Replace with your image asset
                    ),
                    SizedBox(height: 10), // Space between picture and name
                    // Name
                    Text(
                      'John Doe', // Replace with student's name
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18, // Name size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 1), // Space between name and student number
                    // Student Number
                    Text(
                      'Student No: 12345678', // Replace with student number
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12, // Smaller font size for student number
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // List of Drawer Items
            _createDrawerItem(
              icon: Icons.settings,
              text: 'Settings',
              onTap: () => _navigateTo(context, SettingsScreen()),
            ),
            _createDrawerItem(
              icon: Icons.info,
              text: 'About',
              onTap: () => _navigateTo(context, AboutScreen()),
            ),
          ],
        ),
      ),
    );
  }

  Widget _createDrawerItem(
      {required IconData icon, required String text, required VoidCallback onTap}) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 10.0), // Reduced padding
      leading: Icon(icon, color: Colors.white),
      title: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      onTap: onTap,
    );
  }

  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
}
