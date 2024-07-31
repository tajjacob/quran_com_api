import 'package:flutter/material.dart';
import 'package:quran_com_api/quran_com_api.dart';

class AudioSingleListPage extends StatefulWidget {
  const AudioSingleListPage({
    super.key,
    this.audioSingleList,
  });
  final List<AudioSingle>? audioSingleList;

  @override
  State<AudioSingleListPage> createState() => _AudioSingleListPageState();
}

class _AudioSingleListPageState extends State<AudioSingleListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Single List Page'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: (widget.audioSingleList != null)
                ? widget.audioSingleList!
                    .map(
                      (e) => ListTile(
                        leading: Text(e.verseKey ?? ''),
                        title: Text(e.url ?? ''),
                      ),
                    )
                    .toList()
                : [
                    const Text('No Data'),
                  ]),
      ),
    );
  }
}
