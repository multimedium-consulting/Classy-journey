part of 'subject_form_bloc.dart';

abstract class SubjectFormState extends Equatable {
  const SubjectFormState();

  @override
  List<Object> get props => [];
}

class SubjectFormInitial extends SubjectFormState {}

class SubjectFormLoading extends SubjectFormState {}

class SubjectFormSuccess extends SubjectFormState {}

class SubjectFormFailure extends SubjectFormState {
  final String message;

  const SubjectFormFailure(this.message);

  @override
  List<Object> get props => [message];
}
