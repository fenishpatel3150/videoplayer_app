
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';

Widget Tab_Bar() {
  return ButtonsTabBar(
    unselectedLabelStyle: TextStyle(color: Colors.white),
    backgroundColor: Colors.deepOrange,
    unselectedBackgroundColor: Color(0xff1f1f1f),
    labelStyle: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    unselectedBorderColor: Colors.red,
    radius: 80,
    contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
    tabs: [
      Tab(
        text: 'Most',
      ),
      Tab(
        text: 'Funny',
      ),
      Tab(
        text: 'Secondry',
      ),
      Tab(
        text: 'Notification',
      ),
      Tab(
        text: 'Inbox',
      ),

    ],
  );
}