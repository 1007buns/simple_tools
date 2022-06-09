import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_tools/common/routes/names.dart';
import 'package:simple_tools/common/routes/pages.dart';

import 'pages/index_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Simple-tools',
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          appBarTheme: const AppBarTheme(elevation: 0.0)),
      home: const IndexPage(),
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL,
    );
  }
}
