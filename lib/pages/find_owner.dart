import 'package:flutter/material.dart';

class FindOwner extends StatefulWidget {
  const FindOwner({super.key});

  @override
  _FindOwnerPageState createState() => _FindOwnerPageState();
}

class _FindOwnerPageState extends State {
  final TextEditingController _searchController = TextEditingController();
  List<String> owners = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Owner'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Search Owner',
                border: OutlineInputBorder(),
              ),
            ),
            // Add more widgets here
          ],
        ),
      ),
    );
  }
}
