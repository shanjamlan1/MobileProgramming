part of 'verse_bloc.dart';

@immutable
abstract class VerseEvent extends Equatable {}

class EditVerse extends VerseEvent {
  final String sentence;
  final String author;
  final String uid;

  EditVerse(this.sentence, this.author, this.uid);

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
