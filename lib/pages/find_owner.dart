import 'package:flutter/material.dart';

class FindOwner extends StatefulWidget {
  const FindOwner({super.key});

  @override
  _FindOwnerPageState createState() => _FindOwnerPageState();
}

class _FindOwnerPageState extends State<FindOwner> {
  final TextEditingController _searchController = TextEditingController();
  List<String> owners = [
    'John Doe',
    'Jane Smith',
    'Michael Johnson',
    'Emily Davis',
    'Sarah Brown',
  ];
  List<String> filteredOwners = [];

  @override
  void initState() {
    super.initState();
    // Initially show all owners
    filteredOwners = owners;
    _searchController.addListener(_filterOwners);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterOwners() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredOwners =
          owners.where((owner) => owner.toLowerCase().contains(query)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Find Owner',
                hintText: 'Search for an owner',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: filteredOwners.isEmpty
                ? const Center(
                    child: Text(
                      'No owners found',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredOwners.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(filteredOwners[index]),
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                                  Text('Selected ${filteredOwners[index]}'),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
