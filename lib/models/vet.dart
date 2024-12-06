class Vet {
  final String firstName;
  final String lastName;
  final List<String> specialties;

  Vet({
    required this.firstName,
    required this.lastName,
    required this.specialties,
  });

  factory Vet.fromJson(Map<String, dynamic> json) {
    return Vet(
      firstName: json['first_name'],
      lastName: json['last_name'],
      specialties: List<String>.from(json['specialties'] ?? []),
    );
  }
}
