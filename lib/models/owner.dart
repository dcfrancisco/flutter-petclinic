class Owner {
  final String name;
  final String address;
  final String city;
  final String telephone;
  final List<String> pets;

  Owner({
    required this.name,
    required this.address,
    required this.city,
    required this.telephone,
    required this.pets,
  });

  factory Owner.fromJson(Map<String, dynamic> json) {
    return Owner(
      name: json['name'],
      address: json['address'],
      city: json['city'],
      telephone: json['telephone'],
      pets: List<String>.from(json['pets'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'city': city,
      'telephone': telephone,
      'pets': pets,
    };
  }
}
