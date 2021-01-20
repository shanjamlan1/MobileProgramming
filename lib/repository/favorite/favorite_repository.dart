import 'package:mob_prog_project/data/favorites/fav_plan.dart';
import 'package:mob_prog_project/data/favorites/fav_verse.dart';
import 'package:mob_prog_project/data/plan/plan.dart';
import 'package:mob_prog_project/data/plan/plan_database.dart';
import 'package:mob_prog_project/data/verse/verse.dart';

class FavoriteRepository {
  Future addFavoriteVerse(Verse verse, String uid) =>
      FavVerseDatabaseService().addToFavorites(verse, uid);

  Future getFavoriteVerse(String uid) =>
      FavVerseDatabaseService().getVerse(uid);

  Future removeFavoriteVerse(String uid) =>
      FavVerseDatabaseService().removeToFavorite(uid);

  Future addFavoritePlan(Plan plan, String uid) =>
      FavPlanDatabaseService().addToFavoritesPlan(plan, uid);

  Future getFavoritePlan(String uid) => FavPlanDatabaseService().getPlan(uid);

  Future removeFavoritePlan(String uid) =>
      FavPlanDatabaseService().removeToFavoritePlan(uid);
}
