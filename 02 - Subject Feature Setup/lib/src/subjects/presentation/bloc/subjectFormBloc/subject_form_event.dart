part of 'subject_form_bloc.dart';

abstract class SubjectFormEvent extends Equatable {
  const SubjectFormEvent();

  @override
  List<Object> get props => [];
}

class SubjectFormEventCreate extends SubjectFormEvent {
  final Subject subject;

  const SubjectFormEventCreate(this.subject);

  @override
  List<Object> get props => [subject];
}
