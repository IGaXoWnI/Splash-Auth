// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:mystore/components/button.dart';   


class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 100,),
              Image.asset('assets/group.png') , 
              SizedBox(height: 30,), 
              Btn(btntext: 'Sign up', horizontal: 80, raduis: 50, vertical: 25, size: 20, onPressed: () { Navigator.pushReplacementNamed(context, "/signup"); },) , 
              SizedBox(height: 30,),
              Btn(btntext: 'Log In  ', horizontal: 80, raduis: 50, vertical: 25, size: 20, onPressed: () { Navigator.pushReplacementNamed(context, "/login"); },) ,
            ],
          )
        
        ) ,
      ),
    );
  }
}