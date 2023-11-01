import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:petopia/screens/in_app/chatbot.dart';
import 'package:petopia/screens/in_app/homepage.dart';
import 'package:petopia/screens/in_app/orders_page.dart';
import 'package:petopia/theme.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const ChatBotScreen(),
    const OrdersPage(),

    // const ProfilePage(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: Container(
        color: kPurpleColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GNav(
            backgroundColor: kPurpleColor,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: kYellowColor,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            gap: 8,
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
                onPressed: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
              ),
              GButton(
                icon: Icons.add_box_rounded,
                text: 'Add',
                onPressed: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
              ),
              GButton(
                icon: Icons.shopping_bag,
                text: 'Orders',
                onPressed: () {
                  setState(() {
                    _selectedIndex = 2;
                  });
                },
              ),
              // GButton(
              //   icon: Icons.person,
              //   text: 'Profile',
              //   onPressed: () {
              //     setState(() {
              //       _selectedIndex = 2;
              //     });
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
