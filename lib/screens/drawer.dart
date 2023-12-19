import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:my_project/screens/profile_page.dart';
import 'package:my_project/screens/settings_page.dart';
import 'cart.dart';
import 'favorites.dart';
import 'home_page.dart';

class Drawer1 extends StatefulWidget {
  const Drawer1({super.key});

  @override
  State<Drawer1> createState() => _Drawer1State();
}

class _Drawer1State extends State<Drawer1> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  void dispose() {
    _advancedDrawerController.dispose();
    super.dispose();
  }

  _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }

  int currentSelectedIndex = 0;
  static final List pages = [HomePage(), favorites(), Cart(), Settings()];

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
        backdrop: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blueGrey, Colors.blueGrey.withOpacity(0.2)],
            ),
          ),
        ),
        controller: _advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        animateChildDecoration: true,
        rtlOpening: false,
        disabledGestures: false,
        childDecoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black12,
              blurRadius: 0.0,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        drawer: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 50),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.home),
                title: const Text('Home'),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.account_circle_rounded),
                title: const Text('Profile'),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.favorite),
                title: const Text('Favourites'),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.settings),
                title: const Text('Settings'),
              ),
              const Spacer(),
              DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white54,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: const Text('Terms of Service | Privacy Policy'),
                ),
              ),
            ],
          ),
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            iconTheme: const IconThemeData(
              color: Colors.black,
            ),
            toolbarHeight: 65.0,
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: _handleMenuButtonPressed,
                );
              },
            ),
          ),
        ));
  }
}
