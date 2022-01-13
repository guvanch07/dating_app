import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dating_app/repositories/auth/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository _authRepository;
  StreamSubscription<auth.User?>? _streamSubscription;

  LoginBloc({required LoginRepository authRepository})
      : _authRepository = authRepository,
        super(LoginState.unknown()) {
    _streamSubscription = _authRepository.user.listen(
      (user) => add(
        LoginUserChanged(user: user!),
      ),
    );
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginUserChanged) {
      yield* _mapLoginUserChangedToState(event);
    }
  }

  Stream<LoginState> _mapLoginUserChangedToState(
      LoginUserChanged event) async* {
    yield LoginState.authenticated(user: event.user);
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
