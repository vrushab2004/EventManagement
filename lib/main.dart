import 'package:eventz/HomePage.dart';
import 'package:eventz/firebase_options.dart';
import 'package:eventz/login1.dart';
import 'package:eventz/login2.dart';
import 'package:eventz/otp.dart';
import 'package:eventz/phone.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Define the named routes
      routes: {
        '/': (context) => Home(),
        '/login': (context) => LoginPage(),
        'phone': (context) => MyPhone(),
        'verify': (context) => MyVerify(),
      },
      initialRoute: '/',
    );
  }
}
