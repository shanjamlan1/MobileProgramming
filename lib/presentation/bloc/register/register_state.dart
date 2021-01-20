part of 'register_bloc.dart';

@immutable
abstract class RegistrationState extends Equatable {}

class RegistrationInitialState extends RegistrationState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class RegistrationLoadingState extends RegistrationState {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class RegistrationSuccessState extends RegistrationState {
  final FirebaseUser user;
  RegistrationSuccessState({@required this.user});
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class RegistrationFailureState extends RegistrationState {
  final String message;
  RegistrationFailureState({@required this.message});
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
