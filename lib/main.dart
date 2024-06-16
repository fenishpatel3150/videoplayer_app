import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:videoplayer_app/screen/provider/VideoProvider.dart';
import 'package:videoplayer_app/screen/view/home/Home_screen.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => VideoProvider(),)
    ],
      child: const MyApp(),
    ),

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
