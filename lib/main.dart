import 'package:flutter/material.dart';
import 'package:flutter_petclinic/petclinic_app.dart';

void main() {
  runApp(const PetClinicApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
