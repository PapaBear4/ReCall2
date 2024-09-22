import 'package:ReCall2/person/bloc/person_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ReCall2/person/view/people_list.dart'; 

class PersonPage extends StatelessWidget {
  const PersonPage({super.key});

  @override
  Widget build
(BuildContext context) {
    return BlocProvider(
      create: (context) => PersonBloc()..add(const LoadDummyPeople(numberOfPeople: 6)), // Initialize your PersonBloc
      child: Scaffold(
        appBar: AppBar(
          title: const Text('These are my people'),
        ),
        body: const PersonListView(), // Display the PersonListView
      ),
    );
  }
}
