import 'package:flutter/material.dart';
import 'package:mystore/components/about-component.dart';

class Aboutpage3 extends StatelessWidget {
  const Aboutpage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: About(
          NBR: '3/3',
          title: 'Get Your Order',
          description:
              'Business or commerce an order is a stated intention either spoken to engage in a commercial transaction specific products',
          path: 'assets/Group 3.png',
          onPressed_skip: () {
            Navigator.of(context).pushNamed("/login");
          },
          onPressed_next: () {
            Navigator.of(context).pushNamed("/login");
          },
          btntext: 'Next >'),
    );
  }
}
