<h2 align = "center"> 1. Video Player </h2>


The `video_player` package in Flutter is a popular choice for integrating video playback capabilities into your Flutter applications. Here’s a detailed description of the `video_player` package, including its features, installation, and basic usage:

### Description
The `video_player` package provides the ability to play video files and streams in Flutter applications. It supports both local video files and video streams from the internet. The package offers a wide range of functionalities, including play, pause, seek, and volume control, making it suitable for various video playback needs.

### Features
- **Play/Pause/Stop**: Basic controls to play, pause, and stop videos.
- **Seek**: Ability to seek to a specific position in the video.
- **Volume Control**: Adjust the volume of the video.
- **Full-Screen Mode**: Support for full-screen video playback.
- **Looping**: Play videos in a loop.
- **Subtitles**: Support for displaying subtitles.
- **Video Player Controller**: Provides control over video playback and exposes various playback properties.

### Installation
To use the `video_player` package, you need to add it to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter:
    sdk: flutter
  video_player: ^2.5.1
```

Then, run `flutter pub get` to install the package.

### Basic Usage

Here's a simple example of how to use the `video_player` package in a Flutter application:

1. **Import the package**:

```dart
import 'package:video_player/video_player.dart';
```

2. **Initialize the video player controller**:

```dart
class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'https://www.example.com/sample-video.mp4',
    )
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Video Player Example')),
      body: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
```

### Explanation
1. **Initialization**: The `VideoPlayerController` is initialized with a video source (in this case, a network URL). The controller is then initialized, and the UI is updated once the video is ready.
2. **Dispose**: The controller is disposed of when it is no longer needed to free up resources.
3. **UI**: The `VideoPlayer` widget is used to display the video. The `AspectRatio` widget ensures the video maintains the correct aspect ratio. A `FloatingActionButton` allows the user to play and pause the video.

### Additional Functionality
- **Seek to a specific position**:
  ```dart
  _controller.seekTo(Duration(seconds: 30));
  ```
- **Set looping**:
  ```dart
  _controller.setLooping(true);
  ```
- **Set volume**:
  ```dart
  _controller.setVolume(0.5);
  ```

### Conclusion
The `video_player` package in Flutter is a powerful tool for adding video playback capabilities to your applications. With its rich set of features and easy-to-use API, it can handle a wide range of video playback scenarios, making it a versatile choice for developers.

<img src = "https://github.com/fenishpatel3150/videoplayer_app/assets/143187609/1fde8b34-8c12-48dc-96f8-13679247395c" width=22% height=35%>
<img src = "https://github.com/fenishpatel3150/videoplayer_app/assets/143187609/ee4c5c62-bc0c-4691-9abe-87ec3f53a4b1" width=22% height=35%>
<img src = "https://github.com/fenishpatel3150/videoplayer_app/assets/143187609/1906bb93-1843-4002-b66f-7cfe057c18dc" width=22% height=35%>
<img src = "https://github.com/fenishpatel3150/videoplayer_app/assets/143187609/d8cf7166-a3e7-44ed-8c0b-8d67b98cbbea" width=22% height=35%>




https://github.com/fenishpatel3150/videoplayer_app/assets/143187609/6133443f-7475-428e-b4f3-3b36a1532b57
