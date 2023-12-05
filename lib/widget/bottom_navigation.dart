import 'package:flutter/material.dart';

import '../utils/colors.dart';

class BottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabTapped;

  const BottomNavigation({
    Key? key,
    required this.selectedIndex,
    required this.onTabTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      selectedItemColor: darkblue,
      unselectedItemColor: Colors.black,
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
      ),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/images/home.png",
            width: MediaQuery.of(context).size.width * 0.06,
            color: selectedIndex == 0 ? darkblue : Colors.black,
          ),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/images/category.png",
            width: MediaQuery.of(context).size.width * 0.06,
            color: selectedIndex == 1 ? darkblue : Colors.black,
          ),
          label: 'Category',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/images/calendar.png",
            width: MediaQuery.of(context).size.width * 0.06,
            color: selectedIndex == 2 ? darkblue : Colors.black,
          ),
          label: 'Calendar',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/images/messenger.png",
            width: MediaQuery.of(context).size.width * 0.06,
            color: selectedIndex == 3 ? darkblue : Colors.black,
          ),
          label: "Messenger",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/images/user.png",
            width: MediaQuery.of(context).size.width * 0.06,
            color: selectedIndex == 4 ? darkblue : Colors.black,
          ),
          label: 'Profile',
        ),
      ],
      currentIndex: selectedIndex,
      onTap: onTabTapped,
    );
  }
}
