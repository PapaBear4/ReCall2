import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ReCall2/contact/contact.dart';
import 'package:ReCall2/repositories/contact_repository.dart';

void main() {
  runApp(Recall2());
}

class Recall2 extends StatelessWidget {
  const Recall2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact App',
      home: BlocProvider(
        create: (context) => ContactBloc(
          contactRepository: ContactRepository(),
        )..add(LoadContacts()),
        child: ContactScreen(),
      ),
    );
  }
}
