part of 'register_bloc.dart';

@immutable
abstract class RegistrationEvent extends Equatable {}

class SignUpEvent extends RegistrationEvent {
  final String email;
  final String password;
  final String password1;
  final String name;

  SignUpEvent(
      {@required this.email,
      @required this.name,
      @required this.password,
      @required this.password1});
  List<Object> get props => throw UnimplementedError();
}
