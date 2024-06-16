import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:videoplayer_app/screen/provider/VideoProvider.dart';
import 'package:videoplayer_app/screen/view/video/video_screen.dart';

import '../../../../utils/VideoPlayerList.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final videoTrue = Provider.of<VideoProvider>(context);
    final videoFalse = Provider.of<VideoProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          20,
              (index) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Stack(
                  children: [
                    Container(
                      height: 320,
                      width: double.infinity,
                      color: Colors.black,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 60),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Video_Player(),
                                  ),

                                );
                                videoIndex=index;
                              },
                              child: Container(
                                height: 200,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent,
                                  image: DecorationImage(
                                    image: AssetImage(VideoPlayerList[index]['VideoImage']),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                             Padding(
                               padding: const EdgeInsets.all(8),
                               child: Icon(Icons.favorite_border,color: Colors.white,),
                             ),
                              Padding(
                                padding: const EdgeInsets.all(2),
                                child: Text(VideoPlayerList[index]['like'],style: TextStyle(color: Colors.white),),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Icon(
                                  CupertinoIcons.conversation_bubble,
                                  color: Colors.white,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(2),
                                child:  Text(VideoPlayerList[index]['comment'],style: TextStyle(color: Colors.white),),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: Icon(
                                  Icons.send,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      color: Colors.black,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(6),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blueAccent,
                                image: DecorationImage(
                                  image: AssetImage(VideoPlayerList[index]['logo']),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            VideoPlayerList[index]['name'],
                            style: TextStyle(color: Colors.white),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Icon(
                              Icons.more_vert,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
