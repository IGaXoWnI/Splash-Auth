// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, dead_code
import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mystore/screens/homepage.dart';
import 'package:mystore/screens/login.dart';
import 'package:mystore/screens/signup.dart';
import 'package:mystore/screens/about/about1.dart';
import 'package:mystore/screens/about/about2.dart';
import 'package:mystore/screens/about/about3.dart';
import 'package:sizer/sizer.dart';


bool islogin = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  var user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    islogin = false;
  } else {
    islogin = true;
  }
  runApp( 
     DevicePreview(
      enabled: true,
      builder: (BuildContext context)=>const MyApp(),
      )
);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType){
        return MaterialApp(
        useInheritedMediaQuery: true,
        builder: DevicePreview. appBuilder,
        locale: DevicePreview. locale(context),
        debugShowCheckedModeBanner: false,
        home: islogin == false ? Home() : Homepage(),
      );
      }
      
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          "/": (context) => Aboutpage1(),
          "/about2": (context) => Aboutpage2(),
          "/about3": (context) => Aboutpage3(),
          "/login": (context) => Login(),
          "/signup": (context) => Signup(),
          "/homepage": (context) => Homepage(),
          
        });
  }
}
