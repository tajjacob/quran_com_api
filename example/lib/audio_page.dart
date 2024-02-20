import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quran_com_api/quran_com_api.dart';

class AudioPage extends StatelessWidget {
  const AudioPage({super.key});

  @override
  Widget build(BuildContext context) {
    AudioFile? audioFileModel;
    List<AudioFile>? audioFileList;
    List<Recitation>? recitationList;
    AudioFileRepoInterface audioFileRepo = AudioFileRepoInterface();
    RecitationRepoInterface recitationRepo = RecitationRepoInterface();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Page'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  audioFileModel = await audioFileRepo.getAudioFile(
                    reciterId: 1,
                    chapterNo: 1,
                  );
                  log('audioFileModel: ${audioFileModel?.audioUrl}');
                },
                child: const Text('Get Audio File'),
              ),
              ElevatedButton(
                onPressed: () async {
                  audioFileList = await audioFileRepo.getAudioFileList(
                    reciterId: 1,
                  );
                  log('audioFileModel: ${audioFileList?.first.audioUrl}');
                },
                child: const Text('Get Audio File List'),
              ),
              ElevatedButton(
                onPressed: () async {
                  recitationList = await recitationRepo.getRecitationList(
                    language: 'my',
                  );
                  log('recitationList: ${recitationList?.first.reciterName}');
                },
                child: const Text('Get Recitation List'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
