// ignore_for_file: annotate_overrides, prefer_const_constructors, sized_box_for_whitespace, must_be_immutable, prefer_const_literals_to_create_immutables, unnecessary_new, prefer_typing_uninitialized_variables, avoid_print, unnecessary_null_comparison, use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:mystore/components/button.dart';
import 'package:mystore/components/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';


class Signup extends StatefulWidget {
  final bool? isChecked = true;

  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  var myname, myemail, mypassword;

  GlobalKey<FormState> formstate = new GlobalKey<FormState>();

  signUp() async {
    var formdata = formstate.currentState;
    if (formdata != null) {
      if (formdata.validate()) {
        formdata.save();

        try {
          UserCredential userCredential =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: myemail,
            password: mypassword,
          );
          return userCredential ;
        }  on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') { 
            AwesomeDialog(context: context , title: 'error' ,body: Text('The password provided is too weak') ).show();
          } else if (e.code == 'email-already-in-use') {
            AwesomeDialog(context: context , title: 'error' ,body: Text('The account already exists for that email') ).show();
           }
        } catch (e) {
          print(e);
        }
      } 
    }
  }

  @override
  Widget build(BuildContext context) {
    var isChecked;
    return Scaffold(
      body: SafeArea(
          child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/logo.png',
              width: 84,
              height: 92,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Sign Up',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 15,
            ),
            Form(
                key: formstate,
                child: Column(
                  children: [
                    Textf(
                      hint: 'Name',
                      ispasssword: false,
                      path: 'assets/Icons/Profile.png',
                      validator: (val) {
                        if (val != null && val.isEmpty) {
                          return "enter your name";
                        }
                        return null;
                      },
                      onsave: (val) {
                        myname = val;
                      },
                    ),
                    Textf(
                      hint: 'Email',
                      path: 'assets/Icons/Message.png',
                      ispasssword: false,
                      validator: (val) {
                        if (val != null && val.isEmpty) {
                          return "enter your Email";
                        }
                        return null;
                      },
                      onsave: (val) {
                        myemail = val;
                      },
                    ),
                    Textf(
                      hint: 'Password',
                      path: 'assets/Icons/Lock.png',
                      ispasssword: true,
                      validator: (val) {
                        if (val != null && val.isEmpty) {
                          return "enter your Password";
                        }
                      },
                      onsave: (val) {
                        mypassword = val;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CheckboxListTile(
                      title: const Text('I accept all the Terms & Conditions'),
                      value: isChecked,
                      onChanged: (bool? newValue) {
                        (Null Function() param0) {}(() {
                          isChecked = newValue;
                        });
                      },
                      activeColor: Color.fromRGBO(246, 121, 82, 1),
                      checkColor: Colors.white,
                      controlAffinity: ListTileControlAffinity.leading,
                      tristate: true,
                    ),
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            Btn(
              btntext: 'Sign up',
              horizontal: 90,
              raduis: 60,
              vertical: 25,
              size: 20,
              onPressed: () async {
                UserCredential response = await signUp();
                print('-------------------------------------------------');
                if (response!= null){
                  Navigator.of(context).pushNamed("/login");
                }
                print('-------------------------------------------------');   
                
              },
            ), 
            SizedBox(
              height: 30,
            ),
            Row(
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
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/Icons/fb.png'),
                  Image.asset('assets/Icons/google.png')
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70),
              child: Row(
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(
                        color: Color.fromRGBO(28, 26, 25, 0.5), fontSize: 18),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, "/login");
                    },
                    child: Text(
                      ' Log In',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
