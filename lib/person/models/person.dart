// Import the equatable package for easy comparison of objects
import 'package:equatable/equatable.dart';

// Define the Person class, which extends Equatable for efficient state comparisons
/// Represents a person with their basic information
class Person extends Equatable {
  // Declare final variables to store person attributes
  final int id;
  final String firstName;
  final String lastName;
  final DateTime birthday;
  // ... other fields could be added here

  // Constructor for the Person class, requiring all attributes to be provided
  const Person({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.birthday,
    // ... other fields
  });

  // CopyWith method to create a new Person object with updated attributes
  Person copyWith({
    int? id,
    String? firstName,
    String? lastName,
    DateTime? birthday,
    // ... other fields
  }) {
    // Return a new Person object with updated values or the original values if null
    return Person(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      birthday: birthday ?? this.birthday,
      // ... other fields
    );
  }

  // Override the props method from Equatable to define the properties used for comparison
  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        birthday, /* ... other fields*/
      ];
}
