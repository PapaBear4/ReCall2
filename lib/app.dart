import 'package:ReCall2/contact/view/contact_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ReCall2/contact/contact.dart';
import 'package:ReCall2/repositories/contact_repository.dart';

void main() {
  runApp(ReCall2());
}

class ReCall2 extends StatelessWidget {
  const ReCall2({super.key});

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
