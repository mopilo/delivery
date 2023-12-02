import 'package:delivery/features/authentication/domain/repositories/auth_repository.dart';
import 'package:delivery/features/authentication/presentation/providers/states/auth_state.dart';
import 'package:delivery/features/track/domain/repositories/track_repository.dart';
import 'package:delivery/features/track/presentation/providers/states/track_state.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class TrackNotifier extends StateNotifier<TrackState> {
  final TrackRepository trackRepository;

  TrackNotifier({
    required this.trackRepository,
  }) : super(const TrackState.initial());

  Future<void> getTrackData() async {
    state = const TrackState.loading();
    final response = await trackRepository.getTrackData(
    );

    state = await response.fold(
          (failure) => TrackState.failure(failure),
          (user) async {
          return const TrackState.success();
      },
    );
  }
}