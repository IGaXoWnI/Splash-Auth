// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, deprecated_member_use

import 'package:flutter/material.dart';

class Btn extends StatelessWidget {

  final String btntext ;
  final double horizontal , vertical , raduis;
  final double size ; 
  final void Function() onPressed ;
  
  const Btn({
    Key? key,
    required this.btntext,
    required this.horizontal,
    required this.raduis,
    required this.vertical ,
    required this.size , 
    required this.onPressed ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
          onPressed: onPressed,
              style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(raduis)
        ),
        primary: Color.fromRGBO(246, 121, 82, 1) , 
        
    ),
          
          child: Text(btntext , style: TextStyle(fontSize: size),),
          
          
        );
      
    
  }
}
