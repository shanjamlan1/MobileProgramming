import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_prog_project/presentation/bloc/register/register_bloc.dart';

import 'package:mob_prog_project/presentation/ui/login/pages/login.dart';
import 'package:mob_prog_project/presentation/ui/register/components/body.dart';
import 'package:mob_prog_project/repository/authentication/authentication_repository.dart';

import '../../homepage/homepage.dart';

class RegisterPageParent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationBloc(AuthenticationRepository()),
      child: RegisterPage(),
    );
  }
}

class RegisterPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordController1 = TextEditingController();

  RegistrationBloc registrationBloc;

  Widget build(BuildContext context) {
    registrationBloc = BlocProvider.of<RegistrationBloc>(context);

    return Scaffold(
      body: BlocListener<RegistrationBloc, RegistrationState>(
        listener: (context, state) {
          if (state is RegistrationSuccessState) {
            return navigationToHomePage(context, state.user);
          } else if (state is RegistrationFailureState) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        child: BlocBuilder<RegistrationBloc, RegistrationState>(
            builder: (context, state) {
          if (state is RegistrationInitialState) {
            return buildInitialUI(context);
          } else if (state is RegistrationLoadingState) {
            return buildLoadingUI();
          } else if (state is RegistrationSuccessState) {
            return Container();
          } else if (state is RegistrationFailureState) {
            return buildInitialUI(context);
          }
          return buildInitialUI(context);
        }),
      ),
    );
  }

  Widget buildInitialUI(BuildContext context) {
    return Body(
      email: emailController,
      username: nameController,
      password1: passwordController,
      password2: passwordController1,
      toLoginPage: () {
        navigationToLoginPage(context);
      },
      addUser: () {
        addUser();
      },
    );
  }

  void addUser() {
    registrationBloc.add(SignUpEvent(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        password1: passwordController1.text));
  }

  Widget buildLoadingUI() {
    return Center(child: CircularProgressIndicator());
  }

  void navigationToHomePage(BuildContext context, FirebaseUser user) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomePageParent();
    }));
  }

  void navigationToLoginPage(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LoginPageParent();
    }));
  }
}
