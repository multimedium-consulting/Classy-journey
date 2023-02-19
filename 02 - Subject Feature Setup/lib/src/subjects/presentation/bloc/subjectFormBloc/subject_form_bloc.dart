import 'package:bloc/bloc.dart';
import 'package:classy/src/subjects/subject.dart';
import 'package:equatable/equatable.dart';

part 'subject_form_event.dart';
part 'subject_form_state.dart';

class SubjectFormBloc extends Bloc<SubjectFormEvent, SubjectFormState> {
  final ISubjectRepository _subjectRepository;

  SubjectFormBloc(this._subjectRepository) : super(SubjectFormInitial()) {
    on<SubjectFormEventCreate>((event, emit) async {
      emit(SubjectFormLoading());
      final result = await _subjectRepository.createSubject(event.subject);
      result.fold(
        (failure) => emit(SubjectFormFailure(failure.errorMessage ?? "")),
        (unit) => emit(SubjectFormSuccess()),
      );
    });
  }
}
