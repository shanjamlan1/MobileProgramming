import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_prog_project/presentation/bloc/login/login_bloc.dart';
import 'package:mob_prog_project/presentation/ui/homepage/homepage.dart';
import 'package:mob_prog_project/presentation/ui/login/components/body.dart';
import 'package:mob_prog_project/presentation/ui/register/pages/register.dart';
import 'package:mob_prog_project/repository/authentication/authentication_repository.dart';

class LoginPageParent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(AuthenticationRepository()),
      child: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginBloc loginBloc;
  @override
  Widget build(BuildContext context) {
    loginBloc = BlocProvider.of<LoginBloc>(context);

    return WillPopScope(
      onWillPop: () async => null,
      child: Scaffold(
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              return navigationToHomePage(context, state.user);
            } else if (state is LoginFailureState) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          },
          child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
            if (state is LoginInitialState) {
              return buildInitialUI(context);
            } else if (state is LoginLoadingState) {
              return buildLoadingUI();
            } else if (state is LoginSuccessState) {
              return Container();
            } else if (state is LoginFailureState) {
              return buildInitialUI(context);
            }

            return buildInitialUI(context);
          }),
        ),
      ),
    );
  }

  Widget buildInitialUI(BuildContext context) {
    return Body(
      loginForm: emailController,
      passwordForm: passwordController,
      registerView: () {
        navigationToRegisterPage(context);
      },
      checkUser: () {
        checkUser();
      },
      checkFacebookUser: () {
        checkFacebookUser();
      },
    );
  }

  Widget buildLoadingUI() {
    return Center(child: CircularProgressIndicator());
  }

  void checkUser() {
    loginBloc.add(LoginUser(
        email: emailController.text, password: passwordController.text));
  }

  void checkFacebookUser() {}

  void navigationToHomePage(BuildContext context, FirebaseUser user) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomePageParent();
    }));
  }

  void navigationToRegisterPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return RegisterPageParent();
    }));
  }
}
