import 'package:flutter/material.dart';
import 'package:multitab_flutter/page1.dart';
import 'package:multitab_flutter/page2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static List<Widget> _pages = [
    Page1(),
    Page2(),
  ];
  int _selectedTab = 0;
  void _selectTab(indeks) {
    setState(() {
      _selectedTab = indeks;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi MultiTap 1',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Aplikasi Multitap 1'),
        ),
        body: _pages[_selectedTab],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedTab,
            onTap: _selectTab,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.sync),
                label: 'Conversion',
              )
            ]),
      ),
    );
  }
}
