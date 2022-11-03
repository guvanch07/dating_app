part of 'signin_cubit.dart';

enum SignInstatus { initial, submitting, success, error }

class SigninState extends Equatable {
  const SigninState({
    required this.email,
    required this.password,
    required this.status,
  });
  bool get isFormValid => email.isEmpty && password.isEmpty;

  final String email;
  final String password;
  final SignInstatus status;

  factory SigninState.initial() {
    return const SigninState(
      email: '',
      password: '',
      status: SignInstatus.initial,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [email, password, status];

  SigninState copyWith({
    String? email,
    String? password,
    SignInstatus? status,
  }) {
    return SigninState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}
