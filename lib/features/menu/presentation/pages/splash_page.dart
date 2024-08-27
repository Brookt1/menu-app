import 'dart:async';

import 'package:flutter/material.dart';

import 'package:grocery/core/config/route/route.dart' as route;

import '../widgets/custom_text.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, route.menuPage);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/splash_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  const Color.fromARGB(255, 12, 12, 12).withOpacity(0.2),
                  const Color.fromARGB(255, 12, 12, 12).withOpacity(0.2)
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomText(
                      text: 'Welcome to', fontSize: 30, color: Colors.white),
                  CustomText(
                    text: 'SPEEDY CHOW',
                    fontSize: 48,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
