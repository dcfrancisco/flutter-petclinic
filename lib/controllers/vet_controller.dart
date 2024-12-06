import '../models/vet.dart';
import '../services/vet_service.dart';

class VetController {
  final VetService _vetService = VetService();

  Future<List<Vet>> getVets() async {
    try {
      final data = await _vetService.fetchVets();

      if (data['vets'] == null) {
        return [];
      }

      print('Vet data: ${data['vets']}');

      return (data['vets'] as List<dynamic>)
          .map((vetJson) => Vet.fromJson(vetJson))
          .toList();
    } catch (e) {
      print('Error fetching vets: $e');
      return [];
    }
  }
}
