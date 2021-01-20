part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState extends Equatable {}

class AuthInitialState extends AuthenticationState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class AuthenticatedState extends AuthenticationState {
  final FirebaseUser user;
  AuthenticatedState({@required this.user});
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class UnAuthenticatedState extends AuthenticationState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class NetworkErrorState extends AuthenticationState {
  final String message;
  NetworkErrorState(this.message);
  List<Object> get props => throw UnimplementedError();
}
