import 'package:flutter/material.dart';
import 'package:flutter_petclinic/controllers/owner_controller.dart';
import 'package:flutter_petclinic/models/owner.dart';
import 'package:flutter_petclinic/pages/owner_details_page.dart';

class FindOwner extends StatefulWidget {
  const FindOwner({super.key});

  @override
  _FindOwnerPageState createState() => _FindOwnerPageState();
}

class _FindOwnerPageState extends State<FindOwner> {
  final OwnerController _controller = OwnerController();
  final TextEditingController _searchController = TextEditingController();
  List<Owner> owners = [];
  List<Owner> filteredOwners = [];

  @override
  void initState() {
    super.initState();
    _loadOwners();
    _searchController.addListener(_filterOwners);
  }

  Future<void> _loadOwners() async {
    final fetchedOwners = await _controller.getOwners();
    setState(() {
      owners = fetchedOwners;
      filteredOwners = fetchedOwners;
    });
  }

  void _filterOwners() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredOwners = owners.where((owner) {
        return owner.name.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Find Owner',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Last Name',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: filteredOwners.isEmpty
                ? const Center(child: Text('No owners found'))
                : ListView.builder(
                    itemCount: filteredOwners.length,
                    itemBuilder: (context, index) {
                      final owner = filteredOwners[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 16),
                        child: ListTile(
                          title: Text(owner.name),
                          subtitle: Text(
                            'Address: ${owner.address}\n'
                            'City: ${owner.city}\n'
                            'Telephone: ${owner.telephone}\n'
                            'Pets: ${owner.pets.join(", ")}',
                          ),
                          isThreeLine: true,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    OwnerDetailsPage(owner: owner),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
