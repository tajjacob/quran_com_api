import 'package:flutter/material.dart';
import 'package:quran_com_api/quran_com_api.dart';

class AudioFilePage extends StatelessWidget {
  const AudioFilePage({
    super.key,
    required this.audioFileModel,
  });
  final AudioFile audioFileModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio File Page'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: ListTile(
          title: Text('Audio File: ${audioFileModel.audioUrl}'),
          subtitle: Text('File size: ${audioFileModel.fileSize}'),
          leading: Text('Id: ${audioFileModel.chapterId}'),
        ),
      ),
    );
  }
}
