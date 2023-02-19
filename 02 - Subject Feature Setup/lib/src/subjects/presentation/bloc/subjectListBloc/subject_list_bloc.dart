import 'package:bloc/bloc.dart';
import 'package:classy/src/subjects/subject.dart';
import 'package:equatable/equatable.dart';

part 'subject_list_event.dart';
part 'subject_list_state.dart';

class SubjectListBloc extends Bloc<SubjectListEvent, SubjectListState> {
  final ISubjectRepository _subjectRepository;

  SubjectListBloc(this._subjectRepository) : super(const SubjectListInitial()) {
    on<SubjectListEventLoad>((event, emit) async {
      await _fetchSubjects(event, emit);
    });
  }

  Future<void> _fetchSubjects(
      SubjectListEvent event, Emitter<SubjectListState> emit) async {
    try {
      final subjects = _subjectRepository.getSubjects();
      subjects.fold(
        (failure) => const SubjectListFailure(""),
        (subjectList) => emit(SubjectListSuccess(subjectList)),
      );
    } catch (e) {
      emit(SubjectListFailure(e.toString()));
    }
  }
}
