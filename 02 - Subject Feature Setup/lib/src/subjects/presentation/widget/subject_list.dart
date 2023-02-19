//A list of card widgets that displays a list of subjects. The widget calls the bloc to get the list of subjects.
//

import 'package:classy/src/subjects/presentation/widget/widgets.dart';
import 'package:classy/src/subjects/subject.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubjectList extends StatelessWidget {
  const SubjectList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubjectListBloc, SubjectListState>(
      builder: (context, state) {
        if (state is SubjectListLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SubjectListSuccess) {
          return StreamBuilder<List<Subject>>(
            stream: state.subjects,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return SubjectCard(
                      subject: snapshot.data![index],
                    );
                  },
                );
              } else {
                return const Center(
                  child: Text('No subjects found'),
                );
              }
            },
          );
        } else {
          return const Center(
            child: Text('Something went wrong'),
          );
        }
      },
    );
  }
}
