import 'package:flutter/material.dart';
import '../controllers/vet_controller.dart';
import '../models/vet.dart';

class VeterinarianPage extends StatefulWidget {
  const VeterinarianPage({super.key});

  @override
  _VeterinarianPageState createState() => _VeterinarianPageState();
}

class _VeterinarianPageState extends State<VeterinarianPage> {
  final VetController _controller = VetController();
  List<Vet> vets = [];

  @override
  void initState() {
    super.initState();
    _loadVets();
  }

  Future<void> _loadVets() async {
    final fetchedVets = await _controller.getVets();
    setState(() {
      vets = fetchedVets;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Veterinarians',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: vets.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: vets.length,
              itemBuilder: (context, index) {
                final vet = vets[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  child: ListTile(
                    title: Text('${vet.firstName} ${vet.lastName}'),
                    subtitle:
                        Text('Specialties: ${vet.specialties.join(", ")}'),
                  ),
                );
              },
            ),
    );
  }
}
