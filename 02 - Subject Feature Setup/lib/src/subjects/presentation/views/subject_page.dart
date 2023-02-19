import 'package:classy/src/subjects/subject.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../widget/subject_form.dart';
import '../widget/subject_list.dart';

class SubjectPage extends StatelessWidget {
  const SubjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SubjectListBloc>(
          create: (context) =>
              SubjectListBloc(GetIt.I.get<ISubjectRepository>())
                ..add(const SubjectListEventLoad()),
        ),
        BlocProvider<SubjectFormBloc>(
          create: (context) =>
              SubjectFormBloc(GetIt.I.get<ISubjectRepository>()),
        ),
      ],
      child: Column(
        children: const [
          SubjectForm(),
          Expanded(child: SubjectList()),
        ],
      ),
    );
  }
}
