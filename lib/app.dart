import 'package:ReCall2/person/view/person_page.dart';
import 'package:flutter/material.dart';

class ReCall2 extends StatelessWidget {
  const ReCall2({super.key});

  @override
  Widget build(BuildContext context) {

    return const MaterialApp(
      title: 'Person Management App', 
      home: PersonPage(), // Set PersonList as the home screen
    );
  }
}
