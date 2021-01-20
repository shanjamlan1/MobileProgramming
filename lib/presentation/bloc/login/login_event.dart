part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {}

class LoginUser extends LoginEvent {
  final String email;
  final String password;

  LoginUser({@required this.email, @required this.password});
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
