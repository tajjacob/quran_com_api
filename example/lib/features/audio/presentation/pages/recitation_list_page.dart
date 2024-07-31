import 'package:flutter/material.dart';
import 'package:quran_com_api/quran_com_api.dart';

class RecitationListPage extends StatelessWidget {
  const RecitationListPage({
    super.key,
    this.recitationList,
  });
  final List<Recitation>? recitationList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recitation List Page'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: recitationList?.length,
          itemBuilder: (context, index) {
            // sort list ascending by id
            recitationList?.sort((a, b) => a.id!.compareTo(b.id!));
            return ListTile(
              title: Text('Reciter: ${recitationList?[index].reciterName}'),
              leading: Text('Id: ${recitationList?[index].id}'),
              subtitle: Text(
                  'Language: ${recitationList?[index].translatedName!.languageName!}'),
            );
          },
        ),
      ),
    );
  }
}
