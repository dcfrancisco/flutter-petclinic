import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/owner.dart';

class OwnerService {
  Future<List<Owner>> fetchOwners() async {
    try {
      // Load JSON from assets
      final String response = await rootBundle.loadString('assets/owners.json');
      final List<dynamic> data = json.decode(response);

      return data.map((json) => Owner.fromJson(json)).toList();
    } catch (e) {
      print("Error loading owners: $e");
      return [];
    }
  }
}
