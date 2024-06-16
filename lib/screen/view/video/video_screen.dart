import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:videoplayer_app/screen/provider/VideoProvider.dart';
import 'package:videoplayer_app/screen/view/home/componets/ApppBar.dart';
import '../../../utils/VideoPlayerList.dart';

class Video_Player extends StatefulWidget {
  const Video_Player({super.key});

  @override
  State<Video_Player> createState() => _Video_PlayerState();
}

class _Video_PlayerState extends State<Video_Player> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
  }


  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final videoTrue = Provider.of<VideoProvider>(context);
    final videoFalse = Provider.of<VideoProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        title: appbar(),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.white,
              child: ClipRect(),
            ),
            IconButton(
              icon: Icon(videoTrue.playing ? Icons.play_arrow : Icons.pause),
              onPressed: () {
                videoFalse.PlayVideo();
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Night Drive Mashup 2024 | AfterMorning | Chillout |Road Trip Log Drive Mashup',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blueAccent,
                      image: DecorationImage(
                        image: AssetImage(VideoPlayerList[videoIndex]['logo'],),fit: BoxFit.cover
                      ),
                    ),
                  ),
                ),
                Text(
                  VideoPlayerList[videoIndex]['name'],
                  style: TextStyle(color: Colors.white),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Icon(Icons.favorite_border,color: Colors.white,)
                ),
                // Padding(
                //   padding: const EdgeInsets.all(2),
                //   child: Text(VideoPlayerList[videoIndex]['like'],style: TextStyle(color: Colors.white),),
                // ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Icon(
                    CupertinoIcons.conversation_bubble,
                    color: Colors.white,
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(2),
                //   child:  Text(VideoPlayerList[videoIndex]['comment'],style: TextStyle(color: Colors.white),),
                // ),
                Padding(
                  padding: const EdgeInsets.only(right: 15, left: 8),
                  child: Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ...List.generate(
                7,
                    (index) => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Stack(
                        children: [
                          Container(
                            height: 300,
                            width: double.infinity,
                            color: Colors.black,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Container(
                                    height: 200,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: Colors.blueAccent,
                                        image: DecorationImage(
                                            image: AssetImage(VideoPlayerList[videoIndex]['banner'][index],),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 50,
                                    width: double.infinity,
                                    color: Colors.black,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: Container(
                                            height: 50,
                                            width: 50,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.blueAccent,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      VideoPlayerList[videoIndex]
                                                      ['logos'][index]),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            VideoPlayerList[videoIndex]
                                            ['companyName'][index],
                                            style:
                                            TextStyle(color: Colors.white),
                                          ),
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
          ],
        ),
      ),
    );
  }
}

int videoIndex = 0;
