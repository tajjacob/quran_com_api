import 'package:example/features/chapters/presentation/pages/chapter_list_page.dart';
import 'package:example/features/chapters/presentation/pages/chapter_single_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'chapter_info_page.dart';

class ChapterPages extends StatelessWidget {
  const ChapterPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chapter Pages'),
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
                child: const Text('Go to Chapter List Page'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChapterListPage(),
                    ),
                  );
                },
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                child: const Text('Go to Chapter Single Page'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChapterSinglePage(),
                    ),
                  );
                },
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                child: const Text('Go to Chapter Info Page'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChapterInfoPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
