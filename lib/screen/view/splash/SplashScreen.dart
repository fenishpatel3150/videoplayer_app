import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 5),
          () {
                Navigator.of(context).pushReplacementNamed('/home');
      },
    );
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/image/logo0.1.png')),
              ),
            ),
          ),
          Text(
            'Daily Share',
            style: GoogleFonts.ubuntu(color: Color(0xffec1923)
            ,fontWeight: FontWeight.w800,
              fontSize: 25
            ),
          )
        ],
      ),
    );
  }
}
