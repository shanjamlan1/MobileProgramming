part of 'login_bloc.dart';

@immutable
abstract class LoginState extends Equatable {}

class LoginInitialState extends LoginState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class LoginLoadingState extends LoginState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class LoginSuccessState extends LoginState {
  final FirebaseUser user;
  LoginSuccessState({@required this.user});
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class LoginFailureState extends LoginState {
  final String message;

  LoginFailureState({@required this.message});
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
