import 'package:flutter/material.dart';
import 'package:flutter_petclinic/widgets/my_home_page.dart';

class PetClinicApp extends StatelessWidget {
  const PetClinicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter PetClinic",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 101, 123, 102),
        ),
        useMaterial3: true,
      ),
      home: MyHomePage(title: "Flutter PetClinic"),
    );
  }
}
