import 'package:equatable/equatable.dart';

class Plan extends Equatable {
  final String verse, author, title, image, text, type, id, favid;

  Plan(
      {this.verse,
      this.author,
      this.title,
      this.image,
      this.text,
      this.type,
      this.id,
      this.favid});

  List<Object> get props => throw UnimplementedError();
}
