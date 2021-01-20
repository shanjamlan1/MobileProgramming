part of 'homepage_bloc.dart';

@immutable
abstract class HomePageEvent extends Equatable {}

class HomePageLogoutEvent extends HomePageEvent {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class HomePageLoadData extends HomePageEvent {
  List<Object> get props => throw UnimplementedError();
}

class HomePageLoadSearch extends HomePageEvent {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class HomePageLoadSearchData extends HomePageEvent {
  final String query;

  HomePageLoadSearchData(this.query);
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class HomePageLoadUser extends HomePageEvent {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class HomePageLoadFavorites extends HomePageEvent {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class AddFavoritesVerse extends HomePageEvent {
  final Verse verse;

  AddFavoritesVerse(this.verse);

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class GetFavoritesVerse extends HomePageEvent {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class RemoveFavoritesVerse extends HomePageEvent {
  final String uid;

  RemoveFavoritesVerse(this.uid);
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class AddFavoritesPlan extends HomePageEvent {
  final Plan plan;

  AddFavoritesPlan(this.plan);

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class GetFavoritesPlan extends HomePageEvent {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class RemoveFavoritesPlan extends HomePageEvent {
  final String uid;

  RemoveFavoritesPlan(this.uid);
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
