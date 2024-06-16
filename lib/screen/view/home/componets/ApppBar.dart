
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget appbar() {
  return Row(
    children: [
      Center(
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/image/logo0.1.png')),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          'Daily share',
          style:
          GoogleFonts.ubuntu(color: Color(0xffec1923), fontWeight: FontWeight.w600),
        ),
      ),
      Spacer(),
      Icon(
        Icons.search,
        color: Colors.white,
      ),
    ],
  );
}