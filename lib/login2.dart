import 'package:event_mgm/theme/colors.dart';
import 'package:event_mgm/theme/field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage2 extends StatefulWidget {
  const LoginPage2({super.key});

  @override
  State<LoginPage2> createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
  final _usncontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  Future signIn() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    void displayMessageToUser(String message, BuildContext context) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(message),
        ),
      );
    }

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _usncontroller.text.trim(),
        password: _passwordcontroller.text.trim(),
      );
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayMessageToUser(e.code, context);
    }
  }

  @override
  void dispose() {
    _usncontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: Container(
                  height: 250,
                  width: 300,
                  margin: EdgeInsets.only(top: 70),
                  child: Image.asset('assets/my.png'),
                ),
              ),
              SizedBox(height: 50),
              Text(
                'Enter your USN or Roll number and your password',
                style: GoogleFonts.aBeeZee(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 30),
              CustomTextField(
                placeholder: 'Enter Your USN',
                icon: Icons.person,
                obscure: false,
                controller: _usncontroller,
              ),
              SizedBox(height: 13),
              CustomTextField(
                placeholder: 'Password',
                icon: Icons.password,
                obscure: true,
                controller: _passwordcontroller,
              ),
              Container(
                margin: EdgeInsets.only(left: 230, top: 10),
                child: GestureDetector(
                  onTap: () {
                    print('hello');
                  },
                  child: Text(
                    'Forgot password',
                    style: TextStyle(color: Colors.red.shade400),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Center(
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width - 50,
                  child: GestureDetector(
                    onTap: signIn,
                    child: Text(
                      'Login',
                      style: GoogleFonts.aBeeZee(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}