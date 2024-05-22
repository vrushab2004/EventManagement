import 'package:flutter/material.dart';

class secondtab extends StatelessWidget {
  const secondtab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade400,
      child: Center(child: Text('TICKETS',style: TextStyle(fontSize: 50),)),
    );
  }
}