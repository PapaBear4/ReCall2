import 'package:equatable/equatable.dart';

class Relationship extends Equatable {
  final String contact1Id;
  final String contact2Id;
  final String relationshipType;
  final DateTime? startDate;
  final DateTime? endDate;

  const Relationship({
    required this.contact1Id,
    required this.contact2Id,
    required this.relationshipType,
    this.startDate,
    this.endDate,
  });

  @override
  List<Object?> get props => [
        contact1Id,
        contact2Id,
        relationshipType,
        startDate,
        endDate,
      ];

  Relationship copyWith({
    String? contact1Id,
    String? contact2Id,
    String? relationshipType,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return Relationship(
      contact1Id: contact1Id ?? this.contact1Id,
      contact2Id: contact2Id ?? this.contact2Id,
      relationshipType: relationshipType ?? this.relationshipType,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }
}
