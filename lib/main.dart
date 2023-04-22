import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_page/firebase_options.dart';
import 'package:login_page/screens/HomePage.dart';
import 'package:login_page/screens/loginpage.dart';
import './mainpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //     primaryColor: Color(0xFF2661FA),
      //     scaffoldBackgroundColor: Colors.white,
      //     visualDensity: VisualDensity.adaptivePlatformDensity),
      home: MainPage(),
    );
  }
}
