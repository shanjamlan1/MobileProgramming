part of 'verse_bloc.dart';

@immutable
abstract class VerseState extends Equatable {}

class VerseInitialState extends VerseState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class VerseLoadingState extends VerseState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class EditVerseState extends VerseState {
  final String sentence;
  final String author;
  final String uid;

  EditVerseState(this.sentence, this.author, this.uid);

  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class VerseSuccessState extends VerseState {
  final String message;

  VerseSuccessState(this.message);
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class VerseFailureState extends VerseState {
  final String message;

  VerseFailureState({@required this.message});
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
