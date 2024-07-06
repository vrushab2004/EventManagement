import 'package:eventz/theme/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyPhone extends StatefulWidget {
  const MyPhone({Key? key}) : super(key: key);
  static String verify = "";

  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  TextEditingController countryController = TextEditingController();
  var phone = "";

  @override
  void initState() {
    super.initState();
    countryController.text = "+91";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:CustomColors.backgroundColor ,
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/Login-rafiki.png',
                width: 1250,
                height: 250,
              ),
              SizedBox(height: 25),
              Text(
                "Phone Verification",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white),
              ),
              SizedBox(height: 10),
              Text(
                "We need to register your phone without getting started!",
                style: TextStyle(fontSize: 16,color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 10),
                    SizedBox(
                      width: 40,
                      child: TextField(
                        
                        // controller: countryController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "+91",
                          hintStyle: TextStyle(color: Colors.white),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Text(
                      "|",
                      style: TextStyle(fontSize: 33, color: Colors.grey),
                    ),
                    
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
  onChanged: (value) {
    phone = value;
  },
  keyboardType: TextInputType.phone,
  style: TextStyle(color: Colors.white), // This changes the text color to white
  decoration: InputDecoration(
    hintText: 'Enter phone number', // Optional: You can also set a hint text
    hintStyle: TextStyle(color: Colors.white70), // Optional: Hint text color
  ),
)

                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColors.buttoncolor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () async {
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: '${countryController.text + phone}',
                      verificationCompleted: (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(e.message ?? 'Verification failed'),
                        ));
                      },
                      codeSent: (String verificationId, int? resendToken) {
                        MyPhone.verify = verificationId;
                        Navigator.pushNamed(context, 'verify');
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );
                  },
                  child: Text("Send the code",style: TextStyle(color: Colors.white,fontSize: 17),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
