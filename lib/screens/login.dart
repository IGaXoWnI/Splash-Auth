// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_typing_uninitialized_variables, prefer_const_literals_to_create_immutables, use_build_context_synchronously, unnecessary_new, unused_local_variable

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mystore/components/button.dart';
import 'package:mystore/components/textfield.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sizer/sizer.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var myname, myemail, mypassword;
  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signIn() async {
    var formdata = formstate.currentState;
    if (formdata != null) {
      if (formdata.validate()) {
        formdata.save();

        try {
          UserCredential userCredential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: myemail, password: mypassword);
          return userCredential;
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            AwesomeDialog(
                    context: context,
                    title: "error",
                    body: Text('No user found for that email'))
                .show();
          } else if (e.code == 'wrong-password') {
            AwesomeDialog(
                    context: context,
                    title: "error",
                    body: Text('Wrong password provided for that user'))
                .show();
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 16.h,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: Image.asset(
                    'assets/logo.png',
                    width: 84,
                    height: 92,
                  ),
                ),
                
              ),
              
              SizedBox(
                height: 5.h,
                child: Padding(
                  padding: const EdgeInsets.only(top :5.0),
                  child: Text(
                    'Log In',
                    style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.w500), textAlign: TextAlign.center,
                  ),
                ),
              ),
              
              SizedBox(
                height: 25.h,
                child: Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: Form(
                      key: formstate,
                      child: Column(
                        children: [
                          Textf(
                              hint: 'Email',
                              ispasssword: false,
                              path: 'assets/Icons/Message.png',
                              onsave: (val) {
                                myemail = val;
                              },
                              validator: (val) {
                                if (val != null && val.isEmpty) {
                                  return "enter your Email";
                                }
                                return null;
                              }),
                          Textf(
                            hint: 'Password',
                            path: 'assets/Icons/Lock.png',
                            ispasssword: true,
                            onsave: (val) {
                              mypassword = val;
                            },
                            validator: (val) {
                              if (val != null && val.isEmpty) {
                                return "enter your Password";
                              }
                            },
                          ),
                        ],
                      )),
                ),
              ),
              
              SizedBox(
                height: 5.h,
                child: Padding(
                  padding: const EdgeInsets.only(top:3.0),
                  child: Text(
                    'Forgot password?',
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              
              SizedBox(
                height: 12.h,
                child: Padding(
                  padding: const EdgeInsets.only(top:20.0 , bottom: 5),
                  child: Btn(
                    btntext: 'Log In',
                    horizontal: 85,
                    raduis: 60,
                    vertical: 16,
                    size: 13.sp,
                    onPressed: () async {
                      var user = await signIn();
                      if (user != null) {
                        Navigator.of(context).pushReplacementNamed('/homepage');
                      }
                    },
                  ),
                ),
              ),
              
              SizedBox(
                height: 7.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      child: Expanded(
                          child: Divider(
                        thickness: 1,
                        color: Color.fromRGBO(35, 46, 36, 0.6),
                      )),
                    ),
                    Text("   Or   ",
                        style: TextStyle(
                            fontSize: 17, color: Color.fromRGBO(35, 46, 36, 0.6))),
                    Container(
                      width: 120,
                      child: Expanded(
                          child: Divider(
                        thickness: 1,
                        color: Color.fromRGBO(35, 46, 36, 0.6),
                      )),
                    ),
                  ],
                ),
              ),
              
              SizedBox(
                height: 7.h,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/Icons/fb.png'),
                      GestureDetector(
                        child: Image.asset('assets/Icons/google.png'),
                        onTap: () async {
                          UserCredential cred = await signInWithGoogle();
                          if (cred != null) {
                            Navigator.of(context).pushReplacementNamed('/homepage');
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
              
              SizedBox(
                height: 7.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                        Text(
                          'Don’t have an account ?',
                          style: TextStyle(
                              color: Color.fromRGBO(28, 26, 25, 0.5), fontSize: 13.sp),
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(context, "/signup");
                            },
                            child: Text(
                              ' Sign Up',
                              style: TextStyle(fontSize: 14.sp, color: Colors.black),
                            ))
                      ],
                    ),
                  ),
                
              
            ],
          ),
        ),
      )),
    );
  }
}
