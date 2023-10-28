class Machine {
  final int id;
  final String name;
  final int property;
  final String createdAt;
  final String updatedAt;

  const Machine({
    required this.id,
    required this.name,
    required this.property,
    required this.createdAt,
    required this.updatedAt
  });

  factory Machine.fromJson(Map<String, dynamic> json) {
    return Machine(
      id: json['id'] as int,
      name: json['name'] as String,
      property: json['property'] as int,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );
  }
}