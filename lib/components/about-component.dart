import 'package:flutter/material.dart';
import 'package:mystore/components/button.dart';
import 'package:sizer/sizer.dart';

class About extends StatelessWidget {
  final String NBR, title, description, path, btntext;
  final void Function() onPressed_skip, onPressed_next;

  const About({
    Key? key,
    required this.NBR,
    required this.title,
    required this.description,
    required this.path,
    required this.onPressed_skip,
    required this.onPressed_next,
    required this.btntext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, right: 20, bottom: 20, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  NBR,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14.sp, color: Colors.black),
                ),
                GestureDetector(
                  onTap: onPressed_skip,
                  child: Text(
                    'Skip',
                    style: TextStyle(fontSize: 14.sp, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 45.h, child: Image.asset(path)),
          SizedBox(
            height: 6.h,
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 17.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 12.h,
            child: Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 11.sp, height: 1.7, color: Colors.grey[500]),
              ),
            ),
          ),
          SizedBox(
            height: 9.h,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Btn(
                  btntext: btntext,
                  horizontal: 55.sp,
                  raduis: 33,
                  vertical: 2.sp,
                  size: 20,
                  onPressed: onPressed_next),
            ),
          )
        ],
      )),
    );
  }
}
