import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';

class VideoPortfolioScreen extends StatefulWidget {
  const VideoPortfolioScreen({super.key});

  @override
  State<VideoPortfolioScreen> createState() => _VideoPortfolioScreenState();
}

class _VideoPortfolioScreenState extends State<VideoPortfolioScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _controller = VideoPlayerController.network(
    //     'https://freetestdata.com/wp-content/uploads/2022/02/Free_Test_Data_7MB_MP4.mp4');
    _controller = VideoPlayerController.asset('assets/videos/sample.mp4');
    _initializeController = _controller.initialize();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: _initializeController,
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Center(
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    VideoPlayer(_controller),
                    VideoProgressIndicator(_controller, allowScrubbing: true)
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.value.isPlaying) {
            _controller.pause();
          } else {
            _controller.play();
          }
          setState(() {});
        },
        child: FaIcon(_controller.value.isPlaying
            ? FontAwesomeIcons.pause
            : FontAwesomeIcons.play),
      ),
    );
  }
}
