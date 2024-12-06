import 'package:flutter/material.dart';
import '../models/owner.dart';

class OwnerDetailsPage extends StatelessWidget {
  final Owner owner;

  const OwnerDetailsPage({super.key, required this.owner});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(owner.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${owner.name}', style: TextStyle(fontSize: 18)),
            Text('Address: ${owner.address}', style: TextStyle(fontSize: 18)),
            Text('City: ${owner.city}', style: TextStyle(fontSize: 18)),
            Text('Telephone: ${owner.telephone}',
                style: TextStyle(fontSize: 18)),
            Text(
              'Pets: ${owner.pets.join(", ")}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
