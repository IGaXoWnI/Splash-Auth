import 'package:flutter/material.dart';
import 'package:mystore/components/about-component.dart';

class Aboutpage2 extends StatelessWidget {
  const Aboutpage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: About(
          NBR: '2/3',
          title: 'Make Payment',
          description:
              'Payment is the transfer of money services in exchange product or Payments typically made terms agreed',
          path: 'assets/Group2.png',
          onPressed_skip: () {
            Navigator.of(context).pushNamed("/login");
          },
          onPressed_next: () {
            Navigator.of(context).pushNamed("/about3");
          },
          btntext: 'Next >'),
    );
  }
}
