import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quran_com_api/quran_com_api.dart';

import '../../data/repositories/audio_repo.dart';

final audioFileProvider = FutureProvider<AudioFile?>(
  (ref) async {
    return ref.watch(audioFileRepoProvider).getAudioFile();
  },
);
