import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:mob_prog_project/data/plan/plan.dart';
import 'package:mob_prog_project/data/verse/verse.dart';
import 'package:mob_prog_project/repository/authentication/authentication_repository.dart';
import 'package:mob_prog_project/repository/favorite/favorite_repository.dart';
import 'package:mob_prog_project/repository/plan/plan_repository.dart';
import 'package:mob_prog_project/repository/verse/verse_repository.dart';

part 'homepage_state.dart';
part 'homepage_event.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final AuthenticationRepository _repository;
  final VerseRepository _verseRepository;
  final PlanRepository _planRepository;
  final FavoriteRepository _favoriteRepository;

  HomePageBloc(this._repository, this._verseRepository, this._planRepository,
      this._favoriteRepository)
      : super(HomePageInitialState());

  Stream<HomePageState> mapEventToState(HomePageEvent event) async* {
    if (event is HomePageLogoutEvent) {
      await _repository.signOut();
      yield LogOutSuccessState();
    } else if (event is HomePageLoadData) {
      yield HomeLoadingState();
      List<Verse> dn = await _verseRepository.getVerse();
      dynamic user = await _repository.getCurrentUser();
      yield HomePageLoaded(dn, user);
    } else if (event is HomePageLoadSearch) {
      yield HomeLoadingState();
      dynamic user = await _repository.getCurrentUser();
      List<Plan> list = await _planRepository.getPlan();
      print(list);
      yield HomePageSearch(user, list);
    } else if (event is HomePageLoadFavorites) {
      yield HomeLoadingState();
      dynamic user = await _repository.getCurrentUser();
      yield HomePageFavorites(user);
    } else if (event is HomePageLoadUser) {
      yield HomeLoadingState();
      dynamic user = await _repository.getCurrentUser();
      print(user);
      yield HomePageUser(user);
    } else if (event is AddFavoritesVerse) {
      yield HomeLoadingState();
      dynamic user = await _repository.getCurrentUser();
      var a = await _favoriteRepository.addFavoriteVerse(event.verse, user.uid);
      if (a != null) {
        yield HomePageFailureState('Already Exists');
      } else {
        yield HomePageSuccesState('Added to the favorites');
      }
    } else if (event is GetFavoritesVerse) {
      yield HomeLoadingState();
      print('here is the true');
      dynamic user = await _repository.getCurrentUser();
      List<Verse> verseList =
          await _favoriteRepository.getFavoriteVerse(user.uid);

      yield FavoritesVerseState(verseList, user.uid);
    } else if (event is RemoveFavoritesVerse) {
      yield HomeLoadingState();
      await _favoriteRepository.removeFavoriteVerse(event.uid);

      dynamic user = await _repository.getCurrentUser();
      List<Verse> verseList =
          await _favoriteRepository.getFavoriteVerse(user.uid);

      yield FavoritesVerseState(verseList, user.uid);
    } else if (event is AddFavoritesPlan) {
      yield HomeLoadingState();
      dynamic user = await _repository.getCurrentUser();
      var a = await _favoriteRepository.addFavoritePlan(event.plan, user.uid);
      if (a != null) {
        yield HomePageFailureState('Already Exists');
      } else {
        yield HomePageSuccesState('Added to the favorites');
      }
    } else if (event is GetFavoritesPlan) {
      yield HomeLoadingState();
      dynamic user = await _repository.getCurrentUser();
      List<Plan> planList = await _favoriteRepository.getFavoritePlan(user.uid);

      print('Plan : ' + planList.length.toString());
      yield FavoritesPlanState(planList, user.uid);
    } else if (event is RemoveFavoritesPlan) {
      yield HomeLoadingState();
      await _favoriteRepository.removeFavoritePlan(event.uid);

      dynamic user = await _repository.getCurrentUser();
      List<Plan> verseList =
          await _favoriteRepository.getFavoritePlan(user.uid);

      yield FavoritesPlanState(verseList, user.uid);
    } else if (event is HomePageLoadSearchData) {
      yield HomeLoadingState();
      dynamic user = await _repository.getCurrentUser();
      List<Plan> planList = await _planRepository.getQueryPlan(event.query);
      print(planList);

      yield HomePageSearchQuery(user, planList);
    }
  }
}
