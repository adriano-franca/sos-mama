import 'package:flutter/material.dart';
import '../core/colors.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  final String? asset;

  const Video({super.key, this.asset});

  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late VideoPlayerController _controller;
  IconData icon = Icons.pause;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.asset!);

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.setVolume(0);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  GestureDetector(
                    child: VideoPlayer(_controller),
                    onTap: () {
                      if (_controller.value.isPlaying) {
                        _controller.pause();
                        setState(() {
                          icon = Icons.play_arrow;
                        });
                      } else {
                        _controller.play();
                        setState(() {
                          icon = Icons.pause;
                        });
                      }
                    },
                  ),
                  VideoProgressIndicator(_controller, allowScrubbing: true),
                ],
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                if (_controller.value.isPlaying) {
                  _controller.pause();
                  setState(() {
                    icon = Icons.play_arrow;
                  });
                } else {
                  _controller.play();
                  setState(() {
                    icon = Icons.pause;
                  });
                }
              },
              icon: Icon(
                icon,
                color: primaryColor,
                size: 28,
              ))
        ],
      ),
    );
  }
}
