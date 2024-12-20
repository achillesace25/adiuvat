import 'package:consejo_cares/screens/login_screen.dart';
import 'package:consejo_cares/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:consejo_cares/screens/dtr_screen.dart';
import 'package:consejo_cares/screens/profile_screen.dart';
import 'package:consejo_cares/screens/scan_screen.dart';
import 'package:consejo_cares/screens/splash_screen.dart';
import 'package:consejo_cares/screens/task_screen.dart';
import 'screens/home_screen.dart';
import 'widgets/side_navigation_drawer.dart';
import 'widgets/bottom_navigation_bar.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Navigation',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/main': (context) => MainLayout(),
        '/register': (context) => RegisterScreen(),
      },
    );
  }
}

class MainLayout extends StatefulWidget {
  @override
  _MainLayoutState createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  // Screens for bottom navigation
  final List<Widget> _screens = [
    HomeScreen(),
    TaskScreen(),
    ScanScreen(),
    DtrScreen(),
    ProfileScreen(),
  ];

  void _onBottomNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Full-screen gradient background, including AppBar and body
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF001F54),
                Color(0xFF001F54),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent, // Make AppBar transparent
            elevation: 0, // Remove shadow
            title: const Text(
              "Flutter Navigation",
              style: TextStyle(color: Colors.white), // White title color
            ),
            iconTheme: IconThemeData(color: Colors.white), // White icons (burger)
            actions: [
              // Bell notification icon
              IconButton(
                icon: Icon(Icons.notifications, color: Colors.white),
                onPressed: () {
                  print('Bell pressed!');
                },
              ),
            ],
          ),
        ),
      ),
      drawer: SideNavigationDrawer(),
      body: Container(
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
        child: Column(
          children: [
            Expanded(child: _screens[_selectedIndex]),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(
        selectedIndex: _selectedIndex,
        onTap: _onBottomNavTap,
      ),
    );
  }
}
