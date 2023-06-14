import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_universal_base/di/main_viewmodel.dart';

import 'package:provider/provider.dart';

import 'pages/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.brown.shade100,
      statusBarIconBrightness: Brightness.light));
  runApp(ListenableProvider(
    create: (context) => MainViewModel(),
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
