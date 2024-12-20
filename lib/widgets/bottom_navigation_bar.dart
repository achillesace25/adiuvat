import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const BottomNavigation({
    Key? key,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white, // Set the background to white
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, -2),
            blurRadius: 5,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: onTap,
          backgroundColor: Colors.transparent, // Keep transparent for the container color
          selectedItemColor: Colors.black, // Change selected item color to white for the icon
          unselectedItemColor: Colors.black, // Change unselected item color to black for the icon
          type: BottomNavigationBarType.fixed,
          elevation: 0, // Remove shadow
          items: [
            BottomNavigationBarItem(
              icon: _buildIcon(Icons.home, 0),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(Icons.task, 1),
              label: 'Task',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(Icons.qr_code_scanner, 2),
              label: 'Scan',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(Icons.schedule, 3),
              label: 'DTR',
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(Icons.person, 4),
              label: 'Profile',
            ),
          ],
          selectedLabelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black, // Set selected label color to black
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: Colors.black, // Ensure text color is always black
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(IconData iconData, int index) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (selectedIndex == index)
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Color(0xFF001F54), // Blue circle for selected icon
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 2),
                  blurRadius: 5,
                ),
              ],
            ),
          ),
        Icon(
          iconData,
          size: 28,
          color: selectedIndex == index ? Colors.white : Colors.black, // Change icon color to white when selected
        ),
      ],
    );
  }
}
