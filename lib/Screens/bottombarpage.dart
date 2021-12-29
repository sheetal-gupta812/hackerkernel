import 'package:flutter/material.dart';
import 'package:hackerkernel/Screens/dashboard.dart';
import 'package:hackerkernel/Screens/secondpage.dart';
import 'package:hackerkernel/Widgets/color.dart';
import 'firstpage.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({Key? key}) : super(key: key);

  @override
  _BottomBarPageState createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    DashBoard(),
    FirstPage(),
    SecondPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: ColorData.secondary,
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: ColorData.darkBlue,
                ),
                label: '',
                backgroundColor: ColorData.primary),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.ondemand_video_rounded,
                  color: ColorData.secondary,
                ),
                activeIcon: Icon(
                  Icons.ondemand_video_rounded,
                  color: ColorData.darkBlue,
                ),
                label: '',
                backgroundColor: ColorData.primary),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.smart_display_outlined,
                  color: ColorData.secondary,
                ),
                activeIcon: Icon(
                  Icons.smart_display_outlined,
                  color: ColorData.darkBlue,
                ),
                label: '',
                backgroundColor: ColorData.primary),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 30,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }
}
