import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:mob_prog_project/repository/authentication/authentication_repository.dart';
import 'package:email_validator/email_validator.dart';

part 'register_state.dart';
part 'register_event.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final AuthenticationRepository _repository;

  RegistrationBloc(this._repository) : super(RegistrationInitialState());

  void checkCredentials(String email, String password, String password1) {}

  @override
  Stream<RegistrationState> mapEventToState(RegistrationEvent event) async* {
    if (event is SignUpEvent) {
      try {
        yield RegistrationLoadingState();
        if (!EmailValidator.validate(event.email)) {
          yield RegistrationFailureState(message: "Invalid Email");
        } else if (event.password.length < 6) {
          yield RegistrationFailureState(
              message: "Password Length is less than 6");
        } else if (event.password != event.password1) {
          yield RegistrationFailureState(message: "Password Dont Match");
        } else {
          var user = await _repository.registerUser(
              event.email, event.password, event.name);
          yield RegistrationSuccessState(user: user);
        }
      } catch (e) {
        print(e);
        yield RegistrationFailureState(message: "Error Occured");
      }
    }
  }
}
