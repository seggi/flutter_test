import 'package:flutter/material.dart';
import 'package:flutter_stest/provider/provider.dart';
import 'package:flutter_stest/widgets/shared/style.dart';
import 'package:provider/provider.dart';

import 'colllers/page_generator.dart';

void main() {
  runApp(MultiProvider(
    providers: AllProvider.multi(),
    child: const FlutterTestApp(),
  ));
}

class FlutterTestApp extends StatelessWidget {
  const FlutterTestApp({Key? key}) : super(key: key);
  static const title = "Flutter test app";

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: title,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: customGreyColor,
          secondary: customGreyColor,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routeInformationParser: PagesGenerator.router.routeInformationParser,
      routerDelegate: PagesGenerator.router.routerDelegate,
    );
  }
}
