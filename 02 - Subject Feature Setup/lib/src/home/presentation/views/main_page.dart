import 'package:classy/core/core.dart';
import 'package:classy/src/subjects/subject.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.helloWorld),
      ),
      body: const Center(
        child: SubjectPage(),
      ),
    );
  }
}
