import 'package:delivery/features/track/domain/providers/track_provider.dart';
import 'package:delivery/features/track/domain/repositories/track_repository.dart';
import 'package:delivery/features/track/presentation/providers/states/track_notifier.dart';
import 'package:delivery/features/track/presentation/providers/states/track_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final trackStateNotifierProvider =
StateNotifierProvider<TrackNotifier, TrackState>(
      (ref) {
    final TrackRepository trackRepository =
    ref.watch(trackRepositoryProvider);

    return TrackNotifier(
      trackRepository: trackRepository,
    )..getTrackData();
  },
);