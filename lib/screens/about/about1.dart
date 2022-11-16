import 'package:flutter/material.dart';
import 'package:mystore/components/about-component.dart';

class Aboutpage1 extends StatelessWidget {
  const Aboutpage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: About(
          NBR: '1/3',
          title: 'Choose Product',
          description:
              'A product is the item offered for sale. A product can be a service or an item. It can be physical or in virtual or cyber form',
          path: 'assets/group.png',
          onPressed_skip: () {
            Navigator.of(context).pushNamed("/login");
          },
          onPressed_next: () {
            Navigator.of(context).pushNamed("/about2");
          },
          btntext: 'Next >'),
    );
  }
}
