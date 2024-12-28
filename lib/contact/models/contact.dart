// Import the equatable package for easy comparison of objects
import 'package:equatable/equatable.dart';

enum ContactImportance {High, Medium, Low}

// Define the contact class, which extends Equatable for efficient state comparisons
/// Represents a contact with their basic information
class Contact extends Equatable {
  // Declare final variables to store contact attributes
  final int id;
  final String firstName;
  final String lastName;
  final DateTime birthday;
  final ContactImportance importance;
  // ... other fields could be added here

  // Constructor for the contact class, requiring all attributes to be provided
  const Contact({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.birthday,
    required this.importance,
    // ... other fields
  });

  // CopyWith method to create a new contact object with updated attributes
  Contact copyWith({
    int? id,
    String? firstName,
    String? lastName,
    DateTime? birthday,
    ContactImportance? importance,
    // ... other fields
  }) {
    // Return a new contact object with updated values or the original values if null
    return Contact(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      birthday: birthday ?? this.birthday,
      importance: importance ?? this.importance,
      // ... other fields
    );
  }

  // Override the props method from Equatable to define the properties used for comparison
  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        birthday,
        importance,
        /* ... other fields*/
      ];
}
