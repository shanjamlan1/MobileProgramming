part of 'homepage_bloc.dart';

@immutable
abstract class HomePageState extends Equatable {}

class HomePageInitialState extends HomePageState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class LogOutInitialState extends HomePageState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class LogOutSuccessState extends HomePageState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class LogOutLoadingState extends HomePageState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class HomeLoadingState extends HomePageState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class HomePageLoaded extends HomePageState {
  final List<Verse> verseList;
  final FirebaseUser user;
  HomePageLoaded(this.verseList, this.user);
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class HomePageSearch extends HomePageState {
  final FirebaseUser user;
  final List<Plan> planList;

  HomePageSearch(this.user, this.planList);
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class HomePageFavorites extends HomePageState {
  final FirebaseUser user;

  HomePageFavorites(this.user);
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class HomePageUser extends HomePageState {
  final FirebaseUser user;

  HomePageUser(this.user);
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class ToggleFavoriteVerseState extends HomePageState {
  final String message;

  ToggleFavoriteVerseState(this.message);

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class HomePageFailureState extends HomePageState {
  final String message;

  HomePageFailureState(this.message);
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class HomePageSuccesState extends HomePageState {
  final String message;

  HomePageSuccesState(this.message);
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class FavoritesVerseState extends HomePageState {
  final List<Verse> favoriteVerse;
  final String uid;

  FavoritesVerseState(this.favoriteVerse, this.uid);
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class FavoritesPlanState extends HomePageState {
  final List<Plan> favoritePlan;
  final String uid;

  FavoritesPlanState(this.favoritePlan, this.uid);
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class HomePageSearchQuery extends HomePageState {
  final FirebaseUser user;
  final List<Plan> planList;

  HomePageSearchQuery(this.user, this.planList);
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
