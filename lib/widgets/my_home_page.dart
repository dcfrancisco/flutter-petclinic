import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_petclinic/pages/find_owner.dart';
import 'package:flutter_petclinic/pages/home.dart';
import 'package:flutter_petclinic/pages/veterination.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const FindOwner(),
    const VeterinarianPage(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.circular(5),
              ),
              padding: const EdgeInsets.all(4),
              child: const FlutterLogo(size: 25),
            ),
            const SizedBox(width: 10),
            Text(
              widget.title,
              style: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, -1),
                ),
              ],
            ),
            child: BottomNavigationBar(
              backgroundColor: const Color(0xFF34302D),
              type: BottomNavigationBarType.fixed,
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              selectedItemColor: const Color.fromARGB(255, 2, 125, 113),
              unselectedItemColor: Colors.grey,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.people_alt), label: 'Owner'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.local_hospital), label: 'Veterinarian'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
