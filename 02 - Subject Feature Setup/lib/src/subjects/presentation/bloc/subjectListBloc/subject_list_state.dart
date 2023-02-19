part of 'subject_list_bloc.dart';

abstract class SubjectListState extends Equatable {
  const SubjectListState();

  @override
  List<Object> get props => [];
}

class SubjectListInitial extends SubjectListState {
  const SubjectListInitial();
}

class SubjectListLoading extends SubjectListState {
  const SubjectListLoading();
}

class SubjectListSuccess extends SubjectListState {
  final Stream<List<Subject>> subjects;

  const SubjectListSuccess(this.subjects);

  @override
  List<Object> get props => [subjects];
}

class SubjectListFailure extends SubjectListState {
  final String message;

  const SubjectListFailure(this.message);

  @override
  List<Object> get props => [message];
}
