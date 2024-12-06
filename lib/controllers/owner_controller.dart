import '../models/owner.dart';
import '../services/owner_service.dart';

class OwnerController {
  final OwnerService _service = OwnerService();

  Future<List<Owner>> getOwners() async {
    return await _service.fetchOwners();
  }
}
