// Import the equatable package for easy comparison of objects
import 'package:equatable/equatable.dart';

enum ContactFrequency {
  Daily,
  Weekly,
  BiWeekly,
  Monthly,
  Quarterly,
  Yearly,
  Never
}

// Define the contact class, which extends Equatable for efficient state comparisons
/// Represents a contact with their basic information
class Contact extends Equatable {
  // Declare final variables to store contact attributes
  final int id;
  final String firstName;
  final String lastName;

  /// Stored as a DateTime object. You can create a DateTime object in various ways,
  /// for example: `DateTime(1996, 5, 31)` or `DateTime.parse('1996-05-31')`.
  final DateTime birthday;
  final ContactFrequency frequency;
  final DateTime? lastContacted;
  // ... other fields could be added here

  // Constructor for the contact class, requiring all attributes to be provided
  const Contact({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.birthday,
    required this.frequency,
    required this.lastContacted,
    // ... other fields
  });

  // CopyWith method to create a new contact object with updated attributes
  Contact copyWith({
    int? id,
    String? firstName,
    String? lastName,
    DateTime? birthday,
    ContactFrequency? frequency,
    DateTime? lastContacted,
    // ... other fields
  }) {
    // Return a new contact object with updated values or the original values if null
    return Contact(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      birthday: birthday ?? this.birthday,
      frequency: frequency ?? this.frequency,
      lastContacted: lastContacted ?? this.lastContacted,
      // ... other fields
    );
  }

  // Override the props method from Equatable to define the properties used for comparison
  @override
  List<Object?> get props {
    print('Contact props: [id: $id, firstName: $firstName, lastName: $lastName, birthday: $birthday, frequency: $frequency, lastContacted: $lastContacted]');
    return [
      id,
      firstName,
      lastName,
      birthday,
      frequency,
      lastContacted,
      /* ... other fields*/
    ];
  }
}
