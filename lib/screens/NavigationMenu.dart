import 'package:flutter/material.dart';
import 'package:split_money/screens/FriendList.dart';
import 'package:split_money/screens/GroupDetails.dart';
import 'package:split_money/screens/GroupList.dart';
import 'package:split_money/screens/SettleUp.dart';
import 'package:split_money/screens/UserProfilePage.dart';

class NavigationMenu extends StatefulWidget {

  @override
  _NavigationMenuState createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _fragments,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF8E24AA),
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Friends'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Group'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded), label: 'Profile'),
        ],
      ),
    );
  }

  final List<Widget> _fragments = [
    FriendList(),
    GroupList(),
    UserProfilePage(),
  ];
}