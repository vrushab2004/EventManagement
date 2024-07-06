import 'package:event_mgm/HomePage.dart';
import 'package:event_mgm/firebase_options.dart';
import 'package:event_mgm/login1.dart';
import 'package:event_mgm/login2.dart';
import 'package:event_mgm/otp.dart';
import 'package:event_mgm/phone.dart';
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
        '/': (context) => LoginPage(),
        'phone': (context) => MyPhone(),
        'verify': (context) => MyVerify(),
      },
      initialRoute: '/',
    );
  }
}
