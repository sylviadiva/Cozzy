import 'package:flutter/material.dart';
import 'package:flutter_bwa/pages/splash_page.dart';
import 'package:flutter_bwa/providers/space_provider.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_bwa/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SpaceProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    );
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: SplashPage(),
    // );
  }
}
