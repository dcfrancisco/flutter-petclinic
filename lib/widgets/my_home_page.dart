import 'package:flutter/material.dart';
import 'package:flutter_petclinic/pages/find_owner.dart';
import 'package:flutter_petclinic/pages/home.dart';
import 'package:flutter_petclinic/pages/veterination.dart';
import 'package:flutter_petclinic/widgets/custom_nav_bar.dart';

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

  final List<Map<String, dynamic>> navItems = [
    {'icon': Icons.home, 'label': 'Home'},
    {'icon': Icons.people_alt, 'label': 'Owner'},
    {'icon': Icons.local_hospital, 'label': 'Vet'},
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
      bottomNavigationBar: CustomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        navItems: navItems,
        selectedItemColor: const Color.fromARGB(255, 2, 125, 113),
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
