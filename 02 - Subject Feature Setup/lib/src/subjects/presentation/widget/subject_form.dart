//A widget that generates a form for the user to enter the details of a subject.
//It can call the bloc to add a new subject to the database.

import 'package:classy/src/subjects/subject.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubjectForm extends StatefulWidget {
  const SubjectForm({super.key});
  @override
  State<SubjectForm> createState() => _SubjectFormState();
}

class _SubjectFormState extends State<SubjectForm> {
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SubjectFormBloc, SubjectFormState>(
      listener: (context, state) {
        //If the form is successfully submitted, the form is reset and the user is navigated back to the subject list page.
        if (state is SubjectFormSuccess) {
          _nameController.clear();
        }
      },
      child: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Subject Name',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<SubjectFormBloc>(context).add(
                SubjectFormEventCreate(
                  Subject(
                    name: _nameController.text,
                  ),
                ),
              );
            },
            child: const Text('Add Subject'),
          ),
        ],
      ),
    );
  }
}
