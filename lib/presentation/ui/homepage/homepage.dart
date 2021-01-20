import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_prog_project/data/plan/plan.dart';
import 'package:mob_prog_project/data/verse/verse.dart';
import 'package:mob_prog_project/presentation/bloc/homepage/homepage_bloc.dart';
import 'package:mob_prog_project/presentation/ui/global/background.dart';
import 'package:mob_prog_project/presentation/ui/login/pages/login.dart';
import 'package:mob_prog_project/presentation/ui/plan_card/plancard.dart';
import 'package:mob_prog_project/presentation/ui/plan_card/planfavoritecard.dart';
import 'package:mob_prog_project/presentation/ui/plan_card/planpage.dart';
import 'package:mob_prog_project/presentation/ui/verse/versecard.dart';
import 'package:mob_prog_project/presentation/ui/verse/versefavoritecard.dart';
import 'package:mob_prog_project/presentation/ui/verse/versepage.dart';
import 'package:mob_prog_project/repository/authentication/authentication_repository.dart';
import 'package:mob_prog_project/repository/favorite/favorite_repository.dart';
import 'package:mob_prog_project/repository/plan/plan_repository.dart';
import 'package:mob_prog_project/repository/verse/verse_repository.dart';

class HomePageParent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomePageBloc(AuthenticationRepository(),
          VerseRepository(), PlanRepository(), FavoriteRepository())
        ..add(HomePageLoadData()),
      child: MyHomePageState(),
    );
  }
}

class MyHomePageState extends StatefulWidget {
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePageState> {
  int curridx = 0;
  // final FirebaseUser user;
  HomePageBloc homePageBloc;
  // HomePage(this.user);
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    homePageBloc = BlocProvider.of<HomePageBloc>(context);
    return WillPopScope(
        onWillPop: () async => null,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xffff3248),
            elevation: 1.0,
            title: Text("Alive"),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: null,
              )
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            child: Container(
              height: 60,
              color: Color(0xffff3248),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  iconBtnAppbar(Icon(Icons.home), "Home", 0, 'general'),
                  iconBtnAppbar(Icon(Icons.search), "Seach", 1, 'search'),
                  iconBtnAppbar(
                      Icon(Icons.favorite), "Favorites", 1, 'favorites'),
                  iconBtnAppbar(Icon(Icons.person), "Profile", 1, 'profile'),
                ],
              ),
            ),
          ),
          body: BlocListener<HomePageBloc, HomePageState>(
            listener: (context, state) {
              if (state is LogOutSuccessState) {
                navigateToSignUp(context);
              } else if (state is HomePageFailureState) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                  ),
                );
              } else if (state is HomePageSuccesState) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.message),
                  ),
                );
              }
            },
            child: BlocBuilder<HomePageBloc, HomePageState>(
                builder: (context, state) {
              if (state is HomePageInitialState) {
                return Container();
              } else if (state is HomeLoadingState) {
                return buildLoadingUI();
              } else if (state is LogOutSuccessState) {
                return Container();
              } else if (state is HomePageLoaded) {
                return buildVerseList(state.verseList, context);
              } else if (state is HomePageSearch) {
                return buildSearchList(state.planList, context);
              } else if (state is HomePageFavorites) {
                return buildFavoriteList(context);
              } else if (state is HomePageUser) {
                return buildUser(context, state.user);
              } else if (state is FavoritesVerseState) {
                return buildFavoriteVerseList(context, state.favoriteVerse);
              } else if (state is FavoritesPlanState) {
                return buildFavoritePlanList(context, state.favoritePlan);
              } else if (state is HomePageSearchQuery) {
                return buildSearchList(state.planList, context);
              }

              return Container();
            }),
          ),
        ));
  }

  Widget buildVerseList(List<Verse> verseHeadline, BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: Text('Verses of the Day'),
        ),
        Expanded(
            child: verseHeadline.isEmpty
                ? Center(child: Text("List is Empty"))
                : _buildList(verseHeadline, context))
      ],
    );
  }

  Widget _buildList(List<Verse> verseHeadline, BuildContext context) {
    return ListView.builder(itemBuilder: (BuildContext context, int index) {
      if (index == verseHeadline.length) return null;
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
        child: VerseCard(
          verse: verseHeadline[index],
          item: verseHeadline[index],
          navigationToReadPage: () {
            navigationToVersePage(context, verseHeadline[index]);
          },
          addToFavorite: () {
            addFavoriteVerse(verseHeadline[index]);
          },
        ),
      );
    });
  }

  Widget buildSearchList(List<Plan> planList, BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                      controller: searchController,
                      decoration: InputDecoration(
                        hintText: "Search To Discover",
                      ),
                      style: TextStyle(color: Color(0xff42b883))),
                ),
                IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      loadQueryDataPlan(searchController.text);
                      searchController.text = '';
                    })
              ],
            )),
        Expanded(
            child: planList.isEmpty
                ? Center(child: Text("List is Empty"))
                : _buildListPlan(planList, context))
      ],
    );
  }

  Widget _buildListPlan(List<Plan> plan, BuildContext context) {
    return ListView.builder(itemBuilder: (BuildContext context, int index) {
      if (index == plan.length) return null;
      return Padding(
          padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
          child: PlansCard(
            item: plan[index],
            plans: plan[index],
            navigationToPlanPage: () {
              navigationToPlanPage(context, plan[index]);
            },
            addToFavorite: () {
              addFavoritePlan(plan[index]);
            },
          ));
    });
  }

  Widget buildFavoriteList(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(29),
                  side: BorderSide(color: Color(0xff42b883))),
              onPressed: () {
                loadFavoritePlan();
              },
              child: Text('Plans'),
            ),
            RaisedButton(
              onPressed: () {
                loadFavoriteVerse();
              },
              child: Text('Verse'),
              color: Color(0xffffff),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(29),
                  side: BorderSide(color: Color(0xff42b883))),
            )
          ],
        ),
        Container()
      ],
    );
  }

  Widget buildFavoriteVerseList(BuildContext context, List<Verse> verseList) {
    return Column(
      children: <Widget>[
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(29),
                    side: BorderSide(color: Color(0xff42b883))),
                onPressed: () {
                  loadFavoritePlan();
                },
                child: Text('Plans'),
              ),
              RaisedButton(
                onPressed: () {
                  loadFavoriteVerse();
                },
                child: Text('Verse'),
                color: Color(0xffffff),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(29),
                    side: BorderSide(color: Color(0xff42b883))),
              )
            ],
          ),
        ),
        Expanded(
            child: verseList.isEmpty
                ? Center(child: Text("List is Empty"))
                : _buildListVerse(verseList, context))
      ],
    );
  }

  Widget _buildListVerse(List<Verse> verseHeadline, BuildContext context) {
    return ListView.builder(itemBuilder: (BuildContext context, int index) {
      if (index == verseHeadline.length) return null;
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
        child: VerseFavoriteCard(
          verse: verseHeadline[index],
          item: verseHeadline[index],
          navigationToReadPage: () {
            navigationToVersePage(context, verseHeadline[index]);
          },
          removeToFavorite: () {
            removeFavoriteVerse(verseHeadline[index].favid);
          },
        ),
      );
    });
  }

  Widget buildFavoritePlanList(BuildContext context, List<Plan> planList) {
    return Column(
      children: <Widget>[
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(29),
                    side: BorderSide(color: Color(0xff42b883))),
                onPressed: () {
                  loadFavoritePlan();
                },
                child: Text('Plans'),
              ),
              RaisedButton(
                onPressed: () {
                  loadFavoriteVerse();
                },
                child: Text('Verse'),
                color: Color(0xffffff),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(29),
                    side: BorderSide(color: Color(0xff42b883))),
              )
            ],
          ),
        ),
        Expanded(
            child: planList.isEmpty
                ? Center(child: Text("List is Empty"))
                : _buildListPlanFavorite(planList, context))
      ],
    );
  }

  Widget _buildListPlanFavorite(List<Plan> plan, BuildContext context) {
    return ListView.builder(itemBuilder: (BuildContext context, int index) {
      if (index == plan.length) return null;
      return Padding(
          padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
          child: PlansFavoriteCard(
            item: plan[index],
            plans: plan[index],
            navigationToPlanPage: () {
              navigationToPlanPage(context, plan[index]);
            },
            removeToFavorite: () {
              removeFavoritePlan(plan[index].favid);
            },
          ));
    });
  }

  Widget buildUser(BuildContext context, FirebaseUser user) {
    print(user);
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 90),
          margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
          child: Text(
            'Users Profile',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          decoration: BoxDecoration(
            color: Colors.red[200],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.email),
                  Text("${user.email}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ))
                ],
              ),
              Spacer(),
              Align(
                // alignment: Alignment.bottomLeft,
                child: FlatButton(
                    onPressed: () {
                      homePageBloc.add(HomePageLogoutEvent());
                    },
                    child: Text('Log out',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ))),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget buildLoadingUI() {
    return Center(child: CircularProgressIndicator());
  }

  GestureDetector iconBtnAppbar(
    Icon icon,
    String title,
    int index,
    String type,
  ) {
    return GestureDetector(
      onTap: () {
        setState(() {
          findMenu(type);
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          icon,
          SizedBox(
            height: 3,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 9,
                fontWeight: FontWeight.w600,
                color: Color(0xFF97A2AA)),
          )
        ],
      ),
    );
  }

  void findMenu(String type) {
    if (type == 'favorites') {
      loadFavoritePage();
    } else if (type == 'search') {
      loadSearchPage();
    } else if (type == 'profile') {
      loadUserPage();
    } else if (type == 'general') {
      loadHomePage();
    }
  }

  void navigateToSignUp(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LoginPageParent();
    }));
  }

  void loadSearchPage() {
    homePageBloc.add(HomePageLoadSearch());
  }

  void loadHomePage() {
    homePageBloc.add(HomePageLoadData());
  }

  void loadFavoritePage() {
    homePageBloc.add(HomePageLoadFavorites());
  }

  void loadUserPage() {
    homePageBloc.add(HomePageLoadUser());
  }

  void addFavoriteVerse(Verse verse) {
    homePageBloc.add(AddFavoritesVerse(verse));
  }

  void loadFavoriteVerse() {
    homePageBloc.add(GetFavoritesVerse());
  }

  void removeFavoriteVerse(String uid) {
    homePageBloc.add(RemoveFavoritesVerse(uid));
  }

  void addFavoritePlan(Plan plan) {
    homePageBloc.add(AddFavoritesPlan(plan));
  }

  void loadFavoritePlan() {
    homePageBloc.add(GetFavoritesPlan());
  }

  void removeFavoritePlan(String uid) {
    homePageBloc.add(RemoveFavoritesVerse(uid));
  }

  void loadQueryDataPlan(String query) {
    homePageBloc.add(HomePageLoadSearchData(query));
  }

  void navigationToPlanPage(BuildContext context, Plan plans) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PlanPage(plans: plans);
    }));
  }

  void navigationToVersePage(BuildContext context, Verse verse) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return VersePage(verse: verse);
    }));
  }
}
