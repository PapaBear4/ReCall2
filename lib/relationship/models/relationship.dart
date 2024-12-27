import 'package:equatable/equatable.dart';

class Relationship extends Equatable {
  final String person1Id;
  final String person2Id;
  final String relationshipType;
  final DateTime? startDate;
  final DateTime? endDate;

  const Relationship({
    required this.person1Id,
    required this.person2Id,
    required this.relationshipType,
    this.startDate,
    this.endDate,
  });

  @override
  List<Object?> get props => [
        person1Id,
        person2Id,
        relationshipType,
        startDate,
        endDate,
      ];
}
