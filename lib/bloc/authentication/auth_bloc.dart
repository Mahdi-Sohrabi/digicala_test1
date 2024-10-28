import 'package:bloc/bloc.dart';
import 'package:digicala_test1/bloc/authentication/auth_event.dart';
import 'package:digicala_test1/bloc/authentication/auth_state.dart';
import 'package:digicala_test1/data/Repository/authentication_repository.dart';
import 'package:digicala_test1/di/di.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository _repository = locator.get();

  AuthBloc() : super(AuthInitiateState()) {
    on<AuthLoginRequest>(
      (event, emit) async {
        emit(AuthLoadingState());
        var reponse = await _repository.login(event.username, event.password);
        emit(AuthResponseState(reponse));
      },
    );
  }
}
