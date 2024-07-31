import 'package:flutter/material.dart';
import 'package:quran_com_api/quran_com_api.dart';

class AudioFileListPage extends StatelessWidget {
  const AudioFileListPage({
    super.key,
    this.audioFileList,
  });
  final List<AudioFile>? audioFileList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio File List Page'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: audioFileList?.length,
          itemBuilder: (context, index) {
            // convert file size to MB
            double fileSizeMB = audioFileList![index].fileSize! / 1024 / 1024;

            return ListTile(
              title: Text('Audio File: ${audioFileList?[index].audioUrl}'),
              subtitle: Text('File size: ${fileSizeMB.toStringAsFixed(2)} MB'),
              leading: Text('Id: ${audioFileList?[index].chapterId}'),
            );
          },
        ),
      ),
    );
  }
}
