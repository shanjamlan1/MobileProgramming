import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:mob_prog_project/repository/verse/verse_repository.dart';

part 'verse_state.dart';
part 'verse_event.dart';

class VerseBloc extends Bloc<VerseEvent, VerseState> {
  final VerseRepository _verseRepository;

  VerseBloc(
    this._verseRepository,
  ) : super(VerseInitialState());

  Stream<VerseState> mapEventToState(VerseEvent event) async* {
    if (event is EditVerse) {
      try {
        yield VerseLoadingState();
        await _verseRepository.updateVerseData(
            event.uid, event.sentence, event.author);
        yield VerseSuccessState('Edit Success');
      } catch (e) {
        print(e);
        yield VerseFailureState(message: 'Something is Wrong');
      }
    }
  }
}
