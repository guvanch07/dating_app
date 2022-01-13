part of 'login_bloc.dart';

enum  LoginStatus { unknown, authenticated, unauthenticated }

class LoginState extends Equatable {

  final LoginStatus status;
  final auth.User? user;
  
  const LoginState._({
    this.status = LoginStatus.unknown,
    this.user,
  });

  const LoginState.unknown() : this._();

  const LoginState.authenticated({required auth.User user}) : this._(
    status: LoginStatus.authenticated,
    user:user,
  );

  const LoginState.unauthenticated() : this._(
    status: LoginStatus.unauthenticated,
  );
  
  @override
  List<Object?> get props => [status,user];
}


