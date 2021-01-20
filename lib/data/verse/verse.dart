import 'package:equatable/equatable.dart';

class Verse extends Equatable {
  final String sentence, author, id, favid;

  const Verse({this.sentence, this.author, this.id, this.favid});

  List<Object> get props => throw UnimplementedError();
}
