import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:videoplayer_app/screen/view/home/componets/ApppBar.dart';
import 'package:videoplayer_app/screen/view/home/componets/TabBar.dart';

import 'componets/VideoPlayer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: appbar(),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: DefaultTabController(
          length: 5,
          child: Column(
            children: [
              Tab_Bar(),
              Expanded(
                child: TabBarView(children: [
                  VideoScreen(),
                  Text('data'),
                  Text('data'),
                  Text('data'),
                  Text('data'),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }


}