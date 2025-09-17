import 'package:flutter/material.dart';
import 'textfield_screen.dart';
import 'buttons_screen.dart';
import 'selection_screen.dart';
import 'list_screen.dart';
import 'info_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const TextFieldScreen(),
    const ButtonsScreen(),
    const SelectionScreen(),
    const ListScreen(),
    const InfoScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue.shade700,
        unselectedItemColor: Colors.grey.shade600,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.text_fields),
            label: 'TextFields',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.smart_button),
            label: 'Buttons',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_circle),
            label: 'Selection',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Lists',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
        ],
      ),
    );
  }
}