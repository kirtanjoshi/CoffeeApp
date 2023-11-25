import 'package:coffee_app/features/screens/view/Favorite/favorite_screen.dart';
import 'package:coffee_app/features/screens/view/add__cart/AddToCartScreen.dart';
import 'package:coffee_app/features/screens/view/dashboard/home_page.dart';
import 'package:coffee_app/features/screens/view/profile/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Tabs extends StatefulWidget {
  const Tabs({super.key});

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  List<Widget> tabs = [
    const HomeScreen(),
    const FavoriteScreen(),
    const AddToCartScreen(),
    const ProfileScreen(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Material(
        child: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: GNav(
              onTabChange: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              backgroundColor: Colors.black,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.grey.shade800,
              padding: const EdgeInsets.all(10),
              gap: 10,
              tabs: const [
                GButton(icon: Icons.home, text: "Home"),
                GButton(icon: Icons.favorite, text: "Favorites"),
                GButton(icon: Icons.search, text: "Search"),
                GButton(icon: Icons.person, text: "Profile"),
              ],
            ),
          ),
        ),
      ),
      body: tabs[currentIndex],
    );
  }
}
