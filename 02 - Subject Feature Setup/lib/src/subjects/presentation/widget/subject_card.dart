// A dart card is a widget that displays a subject.

import 'package:classy/src/subjects/subject.dart';
import 'package:flutter/material.dart';

class SubjectCard extends StatelessWidget {
  final Subject subject;
  const SubjectCard({Key? key, required this.subject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(subject.name),
        ],
      ),
    );
  }
}
