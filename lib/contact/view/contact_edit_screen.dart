import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ReCall2/contact/bloc/contact_bloc.dart';
import 'package:ReCall2/contact/models/contact.dart';

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
        leading: WillPopScope(
          onWillPop: () async {
            if (_formKey.currentState!.validate()) {
              if (_firstNameController.text != widget.contact?.firstName ||
                  _lastNameController.text != widget.contact?.lastName ||
                  _selectedDate != widget.contact?.birthday ||
                  _selectedFrequency != widget.contact?.frequency) {
                return await showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Unsaved Changes'),
                        content: const Text('You have unsaved changes. Do you want to discard or save them?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(false); // Discard changes and pop
                            },
                            child: const Text('Discard'),
                          ),
                          TextButton(
                            onPressed: () {
                              _saveChanges(context); // Save changes and pop
                              Navigator.of(context).pop(false);
                            },
                            child: const Text('Save'),
                          ),
                        ],
                      ),
                    ) ??
                    false; // If dialog is dismissed, prevent default back behavior
              } else {
                return true; // If no changes, allow popping
              }
            }
            return true;
          },
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
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
      final newContact = Contact(
          id: widget.contact?.id ?? 0,
          firstName: _firstNameController.text,
          lastName: _lastNameController.text,
          birthday: _selectedDate!,
          frequency: _selectedFrequency!,
          lastContacted: null
          );
        if (widget.contact == null) {
            context.read<ContactBloc>().add(CreateContact(newContact));
          }
        else {
            context.read<ContactBloc>().add(UpdateContact(newContact));
        }
      Navigator.pop(context); // Close the edit screen
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
                Navigator.pop(context); // Close the edit screen
              },
              child: const Text('Yes'),
            ),
          ],
        ),
      );
  }
}
