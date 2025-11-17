import 'package:flutter/material.dart';
import 'package:lammaapp/app_theme.dart';
import 'package:lammaapp/nav_bar_icon.dart';
import 'package:lammaapp/taps/event/event_tap.dart';
import 'package:lammaapp/taps/home/home_tap.dart';
import 'package:lammaapp/taps/profile/profile_tap.dart';
import 'package:lammaapp/taps/tasks/tasks_tap.dart';
import 'nav_bar_icon.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<Widget> tabs = [HomeTap(), EventTap(), TasksTap(), ProfileTap()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
     bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6,
        clipBehavior: Clip.antiAlias,
        padding: EdgeInsets.zero,
        color: AppTheme.primary,
        child: BottomNavigationBar(
          elevation: 0,
          currentIndex: currentIndex,
          onTap: (index) {
            if (currentIndex == index) return;
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: NavBarIcon(imageName: 'home'),
              activeIcon: NavBarIcon(imageName: 'home_active'),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: NavBarIcon(imageName: 'event'),
              activeIcon: NavBarIcon(imageName: 'event_active'),
              label: 'Event',
            ),
            BottomNavigationBarItem(
              icon: NavBarIcon(imageName: 'tasks'),
              activeIcon: NavBarIcon(imageName: 'tasks_active'),
              label: 'Tasks',
            ),
            BottomNavigationBarItem(
              icon: NavBarIcon(imageName: 'profile'),
              activeIcon: NavBarIcon(imageName: 'profile_active'),
              label: 'Profile',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add, size: 38),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked
    );
  }
}
