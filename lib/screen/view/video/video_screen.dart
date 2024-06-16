import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:videoplayer_app/screen/provider/VideoProvider.dart';
import 'package:videoplayer_app/screen/view/home/componets/ApppBar.dart';
import '../../../utils/VideoPlayerList.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    initializeVideoPlayer();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  void initializeVideoPlayer() async {
    try {
      final videoPath = VideoPlayerList[videoIndex]['video']; // Adjust according to your JSON structure

      _videoPlayerController = VideoPlayerController.asset(videoPath);

      await _videoPlayerController.initialize();

      _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        autoPlay: true,
        looping: true,
      );

      if (mounted) {
        setState(() {
          // Update UI to reflect initialization
        });
      }
    } catch (e) {
      print("Error initializing video player: $e");
      // Handle initialization error, e.g., show error message to user
    }
  }

  @override
  Widget build(BuildContext context) {
    final videoProvider = Provider.of<VideoProvider>(context);

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
              child: AspectRatio(
                aspectRatio: _videoPlayerController.value.aspectRatio,
                child: _chewieController != null && _chewieController!.videoPlayerController.value.isInitialized
                    ? Chewie(controller: _chewieController!)
                    : Center(child: CircularProgressIndicator()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                VideoPlayerList[videoIndex]['title'],
                 style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 15),
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
                          image: AssetImage(VideoPlayerList[videoIndex]['logo']),
                          fit: BoxFit.cover
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
                  child: Icon(Icons.favorite_border, color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Icon(
                    CupertinoIcons.conversation_bubble,
                    color: Colors.white,
                  ),
                ),
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
                                        image: AssetImage(VideoPlayerList[videoIndex]['banner'][index]),
                                        fit: BoxFit.cover
                                    ),
                                  ),
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
                                                image: AssetImage(VideoPlayerList[videoIndex]['logos'][index]),
                                                fit: BoxFit.cover
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          VideoPlayerList[videoIndex]['companyName'][index],
                                          style: TextStyle(color: Colors.white),
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

int videoIndex = 0; // Ensure this is properly set or managed
