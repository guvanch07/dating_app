part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];

}

class LoginUserChanged extends LoginEvent {

  final auth.User user;
  LoginUserChanged({
    required this.user,
  });

  @override
  List<Object> get props => [user];
}

