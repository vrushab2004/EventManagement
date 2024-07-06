// import 'package:event_mgm/HomePage.dart';
// import 'package:event_mgm/theme/colors.dart';
// import 'package:event_mgm/theme/field.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class LoginPage2 extends StatefulWidget {
//   const LoginPage2({super.key});

//   @override
//   State<LoginPage2> createState() => _LoginPage2State();
// }

// class _LoginPage2State extends State<LoginPage2> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: CustomColors.backgroundColor,
//       body: SingleChildScrollView(
//         child: Center(
//           child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Center(
//                 child: Container(
//                   height: 250,
//                   width: 300,
//                   margin: EdgeInsets.only(top: 70),
//                   child: Image.asset('assets/my.png'),
//                 ),
//                 ),
//                 SizedBox(height: 50,),
//                 Text('Enter your USN or Roll number and your password',style: GoogleFonts.aBeeZee(color:Colors.white,fontSize:12,),),
//                 SizedBox(height: 30,),
//                 CustomTextField(placeholder: 'Enter Your USN', icon: Icons.person,obscure: false,),
//                 SizedBox(height: 13,),
//                 CustomTextField(placeholder: 'Password', icon: Icons.password,obscure: true,),
//                 Container(
//                   margin: EdgeInsets.only(left: 230,top: 10),
//                   child: GestureDetector(onTap: (){print('hello');},
//                      child: Text('Forgot password',style: TextStyle(color: Colors.red.shade400),))),
//                 SizedBox(height: 40,),
//                 Center(
//                   child: Container(
//                     height: 60,
//                     width: MediaQuery.of(context).size.width-50,
//                     child: ElevatedButton(onPressed: (){ Navigator.push(context,MaterialPageRoute(builder: (context)=>Home()));}, child: Text('Login',style:GoogleFonts.aBeeZee(color:Colors.white,fontWeight:FontWeight.bold,fontSize:18)),style: ElevatedButton.styleFrom(
//                         elevation: 5,
//                         backgroundColor: CustomColors.buttoncolor,
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
//                       ),),
//                     ),
//                 )      
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }