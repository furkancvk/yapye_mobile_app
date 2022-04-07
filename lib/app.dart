import 'package:flutter/material.dart';
import 'package:yapye_mobile_app/constants.dart';
import 'screens/home.dart';
import 'screens/shopping_list.dart';
import 'screens/profile.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _App();
}

class _App extends State<App> {
  List<Widget> screens = const [
    Home(),
    ShoppingList(),
    Profile(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.fastfood_rounded),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.format_list_bulleted_rounded),
              label: 'Shopping List',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_rounded),
              label: 'Profile',
            ),
          ],
          iconSize: 36,
          currentIndex: _currentIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: AppColors.dark,
          unselectedItemColor: AppColors.light,
          backgroundColor: AppColors.orange,
          onTap: (index) => {
            setState(() {
              _currentIndex = index;
            }),
          },
        ),
      ),
    );
  }
}
