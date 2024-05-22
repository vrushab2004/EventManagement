import 'package:event_mgm/HomePage.dart';
import 'package:event_mgm/login1.dart';
import 'package:event_mgm/login2.dart';
import 'package:flutter/material.dart';


void main(){
  runApp( const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:LoginPage() ,
    );
  }
}