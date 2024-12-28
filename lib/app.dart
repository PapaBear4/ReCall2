import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ReCall2/contact/contact.dart';
import 'package:ReCall2/repositories/contact_repository.dart';

// This is the main function where the execution of the app begins.
void main() {
  // This line runs the ReCall2 widget, which is the root of the application.
  runApp(const ReCall2());
}

// This is a stateless widget called ReCall2, representing the main application widget.
class ReCall2 extends StatelessWidget {
  // Constructor for the ReCall2 widget, accepting an optional key for widget identification.
  const ReCall2({super.key});

  // This method is responsible for building the UI of the widget.
  // It takes a BuildContext as an argument, which provides information about the widget's location in the widget tree.
  @override
  Widget build(BuildContext context) {
    // This returns a MaterialApp widget, which provides basic material design styling and functionality to the app.
    return MaterialApp(
      // This sets the title of the application, which is displayed in the app's title bar.
      title: 'ReCall App',
      // This sets the home screen of the application to a BlocProvider widget.
      // The BlocProvider is responsible for providing a ContactBloc instance to its child widgets.
      home: BlocProvider(
        // This function creates a new instance of ContactBloc when the BlocProvider is initialized.
        // It takes a BuildContext as an argument and returns a ContactBloc instance.
        create: (context) => ContactBloc(
          // The ContactBloc is initialized with a ContactRepository instance, which is responsible for managing contact data.
          contactRepository: ContactRepository(),
        )
          // This line immediately adds a LoadContacts event to the ContactBloc after it's created.
          // This triggers the bloc to load the initial list of contacts when the app starts.
          ..add(const FetchContacts()),
        // This specifies the child widget of the BlocProvider, which is ContactListScreen in this case.
        // This means that ContactListScreen and its descendant widgets will have access to the ContactBloc instance.
        child: ContactListScreen(),
      ),
    );
  }
}
