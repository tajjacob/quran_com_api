import 'dart:developer';

import 'package:example/features/audio/presentation/pages/audio_file_list_page.dart';
import 'package:example/features/audio/presentation/pages/recitation_list_page.dart';
import 'package:flutter/material.dart';
import 'package:quran_com_api/quran_com_api.dart';

import 'audio_file_page.dart';
import 'audio_single_list_page.dart';

class AudioPage extends StatelessWidget {
  const AudioPage({super.key});

  @override
  Widget build(BuildContext context) {
    AudioFile? audioFileModel;
    List<AudioFile>? audioFileList;
    List<Recitation>? recitationList;
    List<AudioSingle>? audioSingleList;
    AudioFileRepoInterface audioFileRepo = AudioFileRepoInterface();
    RecitationRepoInterface recitationRepo = RecitationRepoInterface();
    AudioSingleRepoInterface audioSingleRepo = AudioSingleRepoInterface();
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
                  if (context.mounted) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AudioFilePage(
                          audioFileModel: audioFileModel!,
                        ),
                      ),
                    );
                  }
                },
                child: const Text('01. Get Audio File'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  audioFileList = await audioFileRepo.getAudioFileList(
                    reciterId: 1,
                  );
                  log('audioFileModel: ${audioFileList?.first.audioUrl}');
                  if (context.mounted) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AudioFileListPage(
                          audioFileList: audioFileList,
                        ),
                      ),
                    );
                  }
                },
                child: const Text('02. Get Audio File List'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  recitationList = await recitationRepo.getRecitationList(
                    language: 'my',
                  );
                  log('recitationList: ${recitationList?.first.reciterName}');
                  if (context.mounted) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecitationListPage(
                          recitationList: recitationList,
                        ),
                      ),
                    );
                  }
                },
                child: const Text('03. Get Recitation List'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  audioSingleList = await audioSingleRepo.getAudioFileList(
                    recitationId: 1,
                    audioSingleParam: AudioSingleParam(
                      chapterNumber: 1,
                    ),
                  );
                  if (audioSingleList != null) {
                    log('audioSingleList: ${audioSingleList?.first.url}.\n'
                        'Note: url provided by api not complete');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AudioSingleListPage(
                          audioSingleList: audioSingleList,
                        ),
                      ),
                    );
                  }
                },
                child: const Text(
                    '04. Get List of Audio Files of single recitation'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
