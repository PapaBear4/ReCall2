import 'package:ReCall2/contact/view/contact_page.dart';
import 'package:flutter/material.dart';

class ReCall2 extends StatelessWidget {
  const ReCall2({super.key});

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      title: 'Relationship Management App', 
      home: ContactPage(), // Entry point for relationship management
    );
  }
}
