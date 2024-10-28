abstract class AuthEvent {}

class AuthLoginRequest extends AuthEvent {
  String username;
  String password;

  AuthLoginRequest(this.password, this.username);
}
