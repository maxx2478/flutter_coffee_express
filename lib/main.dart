import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_universal_base/extensions/launchers.dart';
import 'package:flutter_universal_base/pages/home.dart';
import 'package:flutter_universal_base/pages/home_sub_pages/search/search_viewmodel.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.brown.shade100,
      statusBarIconBrightness: Brightness.light));
  runApp(ListenableProvider(
    create: (context) => SearchViewModel(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: Home(),
    );
  }
}
