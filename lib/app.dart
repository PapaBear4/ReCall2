// Suggested code may be subject to a license. Learn more: ~LicenseLog:1014420267.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3634337362.

import 'package:flutter/material.dart';
import 'package:ReCall2/person/person.dart'; // Import your PersonList view

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      title: 'Person Management App', 
      home: PersonList(), // Set PersonList as the home screen
    );
  }
}
