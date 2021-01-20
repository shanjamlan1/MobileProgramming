import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_prog_project/presentation/bloc/authentication/authentication_bloc.dart';
import 'package:mob_prog_project/presentation/ui/homepage/homepage.dart';
import 'package:mob_prog_project/presentation/ui/login/pages/login.dart';
import 'package:mob_prog_project/repository/authentication/authentication_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create: (context) => AuthenticationBloc(AuthenticationRepository())
          ..add(AppStartedEvent()),
        child: App(),
      ),
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is NetworkErrorState) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthInitialState) {
            return Container();
          } else if (state is AuthenticatedState) {
            return HomePageParent();
          } else if (state is UnAuthenticatedState) {
            return LoginPageParent();
          } else if (state is NetworkErrorState) {
            return LoginPageParent();
          }
        },
      ),
    );
  }
}
