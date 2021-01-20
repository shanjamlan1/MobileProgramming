part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {}

class AppStartedEvent extends AuthenticationEvent {
  @override
  List<Object> get props => throw UnimplementedError();
}
