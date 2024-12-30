import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ReCall2/contact/bloc/contact_bloc.dart';
import 'package:ReCall2/contact/models/contact.dart';
import 'package:ReCall2/contact/view/contact_list_screen.dart';

class ContactEditScreen extends StatefulWidget {
  final Contact? contact;

  const ContactEditScreen({super.key, this.contact});

  @override
  State<ContactEditScreen> createState() => _ContactEditScreenState();
}

class _ContactEditScreenState extends State<ContactEditScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late DateTime? _selectedDate;
  late ContactFrequency? _selectedFrequency;

  @override
  void initState() {
    super.initState();
    _firstNameController =
        TextEditingController(text: widget.contact?.firstName ?? '');
    _lastNameController =
        TextEditingController(text: widget.contact?.lastName ?? '');
    _selectedDate = widget.contact?.birthday;
    _selectedFrequency = widget.contact?.frequency;
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Changes Discarded'),
                duration: Duration(seconds: 2),
              ),
            );
            Navigator.pop(context);
          },
        ),
        title: Text(widget.contact == null ? 'Create Contact' : 'Edit Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _firstNameController,
                decoration: const InputDecoration(
                  labelText: 'First Name',
                  border: OutlineInputBorder(),
                ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a first name';
                    }
                    return null;
                  },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _lastNameController,
                decoration: const InputDecoration(
                  labelText: 'Last Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a last name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text(_selectedDate == null
                      ? 'Birthday: No date selected'
                      : 'Birthday: ${DateFormat('MM/dd/yyyy').format(_selectedDate!)}'),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () async {
                      final selectedDate = await showDatePicker(
                        context: context,
                        initialDate: _selectedDate ?? DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (selectedDate != null) {
                        setState(() {
                          _selectedDate = selectedDate;
                        });
                      }
                    },
                    child: const Text('Select Birthday'),
                  ),
                ],
              ),
                const SizedBox(height: 16),
                DropdownButtonFormField<ContactFrequency>(
                    value: _selectedFrequency,
                    decoration: const InputDecoration(
                      labelText: 'Frequency',
                      border: OutlineInputBorder(),
                    ),
                    items: ContactFrequency.values.map((frequency) {
                      return DropdownMenuItem<ContactFrequency>(
                        value: frequency,
                        child: Text(frequency.toString().split('.').last),
                      );
                    }).toList(),
                    onChanged: (newFrequency) {
                      setState(() {
                        _selectedFrequency = newFrequency;
                      });
                    },
                  validator: (value) {
                      if (value == null) {
                        return 'Please select a frequency';
                      }
                      return null;
                    },
                  ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                     _saveChanges(context);
                    },
                    child: const Text('Save'),
                  ),
                  if (widget.contact != null)
                    ElevatedButton(
                      onPressed: () {
                        _deleteContact(context);
                      },
                      child: const Text('Delete'),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  void _saveChanges(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      print('Original Contact: ${widget.contact}'); 
      final newContact = Contact(
        id: widget.contact?.id ?? 0,
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        birthday: _selectedDate!,
        frequency: _selectedFrequency!,
        lastContacted: widget.contact?.lastContacted, 
      );
      
      print('Updated Contact: $newContact');

      // Dispatch the appropriate event to the ContactBloc
      if (widget.contact == null) {
            context.read<ContactBloc>().add(CreateContact(newContact));
          }
        else {
            context.read<ContactBloc>().add(UpdateContact(newContact));
          }

      // Show a snackbar indicating that changes were saved
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Changes Saved'),
          duration: Duration(seconds: 2),
        ),
      );

      // Navigate back to the list screen using pushReplacement to refresh the list
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const ContactListScreen()));
    }
  }


  void _deleteContact(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Delete Contact?'),
          content: const Text('Are you sure you want to delete this contact?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                context.read<ContactBloc>().add(DeleteContact(widget.contact!.id));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Contact Deleted'),
                    duration: Duration(seconds: 2),
                  ),
                );
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => const ContactListScreen()));
              },
              child: const Text('Yes'),
            ),
          ],
        ),
      );
  }
}
