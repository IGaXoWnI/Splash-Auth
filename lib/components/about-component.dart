import 'package:flutter/material.dart';
import 'package:mystore/components/button.dart';

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
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  NBR,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                GestureDetector(
                  onTap: onPressed_skip,
                  child: Text(
                    'Skip',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Image.asset(path),
          SizedBox(
            height: 50,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 25, color: Colors.black, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, right: 50),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style:
                  TextStyle(fontSize: 14, height: 1.7, color: Colors.grey[500]),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Btn(
              btntext: btntext,
              horizontal: 80,
              raduis: 33,
              vertical: 23,
              size: 20,
              onPressed: onPressed_next)
        ],
      )),
    );
  }
}
