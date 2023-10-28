class Reservation {
  final int id;
  final int machine;
  final int owner;
  final String startTime;
  final String endTime;
  final String createdAt;
  final String updatedAt;

  const Reservation({
    required this.id,
    required this.machine,
    required this.owner,
    required this.startTime,
    required this.endTime,
    required this.createdAt,
    required this.updatedAt
  });

  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      id: json['id'] as int,
      machine: json['machine'] as int,
      owner: json['owner'] as int,
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String,
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );
  }
}