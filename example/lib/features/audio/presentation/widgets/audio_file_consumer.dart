import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../riverpod/audio_file_provider.dart';

class AudioFileConsumer extends ConsumerWidget {
  const AudioFileConsumer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(audioFileProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio File Consumer'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: data.when(
          data: (audioFile) {
            return ListTile(
              onTap: () {
                ref.refresh(audioFileProvider);
              },
              leading: Text('Id: ${audioFile?.id}'),
              title: Text('Audio File: ${audioFile?.audioUrl}'),
              subtitle: Text('File Size: ${audioFile?.fileSize}'),
            );
          },
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => ElevatedButton(
            child: Text('Error: $error, Please try again.'),
            onPressed: () {
              ref.refresh(audioFileProvider);
            },
          ),
        ),
      ),
    );
  }
}
