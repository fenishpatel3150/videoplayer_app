
import 'package:flutter/material.dart';

Widget appbar() {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Icon(
          Icons.video_camera_back,
          color: Colors.deepOrange,
          size: 25,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Text(
          'Daily share',
          style:
          TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
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