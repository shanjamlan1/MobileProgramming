import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mob_prog_project/repository/authentication/authentication_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationRepository _repository;
  LoginBloc(this._repository) : super(LoginInitialState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginUser) {
      try {
        yield LoginLoadingState();
        if (event.email == null || event.password == null) {
          yield LoginFailureState(message: 'Invalid Credentials');
        } else {
          var user = await _repository.signInUser(event.email, event.password);

          if (user == null) {
            yield LoginFailureState(message: 'Invalid Credentials');
          } else {
            yield LoginSuccessState(user: user);
          }
        }

        // yield LoginSuccessState(user: user);irasdasdoc@gmail.com
      } catch (e) {
        yield LoginFailureState(message: e.toString());
      }
    }
  }
}
