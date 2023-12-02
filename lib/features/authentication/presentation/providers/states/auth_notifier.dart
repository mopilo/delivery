import 'package:delivery/features/authentication/domain/repositories/auth_repository.dart';
import 'package:delivery/features/authentication/presentation/providers/states/auth_state.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthenticationRepository authRepository;

  AuthNotifier({
    required this.authRepository,
  }) : super(const AuthState.initial());

  Future<void> loginUser() async {
    state = const AuthState.loading();
    final response = await authRepository.loginUser(
    );

    state = await response.fold(
          (failure) => AuthState.failure(failure),
          (user) async {
          return const AuthState.success();
      },
    );
  }
}