import 'package:bloc/bloc.dart';
import 'package:dating_app/repositories/auth/auth_repository.dart';
import 'package:equatable/equatable.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  final LoginRepository _authRepository;
  SigninCubit({
    required LoginRepository authRepository,
  })  : _authRepository = authRepository,
        super(SigninState.initial());

  void emailChanged(String value) {
    emit(state.copyWith(email: value, status: SignInstatus.initial));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value, status: SignInstatus.initial));
  }

  void signUpWithCredentials() async {
    if (!state.isFormValid || state.status == SignInstatus.submitting) return;
    emit(
      state.copyWith(status: SignInstatus.submitting),
    );
    try {
      await _authRepository.signIn(
          email: state.email, password: state.password);
      emit(
        state.copyWith(status: SignInstatus.success),
      );
    } catch (_) {}
  }
}
