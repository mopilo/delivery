import 'package:delivery/features/authentication/domain/providers/login_provider.dart';
import 'package:delivery/features/authentication/domain/repositories/auth_repository.dart';
import 'package:delivery/features/authentication/presentation/providers/states/auth_notifier.dart';
import 'package:delivery/features/authentication/presentation/providers/states/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authStateNotifierProvider =
StateNotifierProvider<AuthNotifier, AuthState>(
      (ref) {
    final AuthenticationRepository authenticationRepository =
    ref.watch(authRepositoryProvider);

    return AuthNotifier(
      authRepository: authenticationRepository,
    );
  },
);