import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/screen_util.dart';

import 'sources/presentation/home/home.dart';

void main() => runApp(ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, BoxConstraints constraints) {
        ScreenUtil.init(
          constraints,
        );
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            body: Home(),
          ),
        );
      },
    );
  }
}
