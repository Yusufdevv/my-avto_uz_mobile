import 'dart:io';

import 'package:auto/assets/colors/color.dart';
import 'package:auto/assets/constants/icons.dart';
import 'package:auto/features/common/widgets/w_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({
    required this.video,
    Key? key,
  }) : super(key: key);
  final String video;

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(File(widget.video));

    _controller
      ..addListener(() {
        setState(() {});
      })
      ..setLooping(false);
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
    final mediaQuery = MediaQuery.of(context);
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                children: [
                  VideoPlayer(_controller),
                  _ControlsOverlay(controller: _controller),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 10,
          right: 0,
          child: WScaleAnimation(
            onTap: () => Navigator.pop(context),
            child: Container(
              width: 36,
              height: 36,
              margin:
                  EdgeInsets.only(top: mediaQuery.padding.top + 6, right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: white.withOpacity(.1),
              ),
              child: SvgPicture.asset(AppIcons.cancel, fit: BoxFit.scaleDown),
            ),
          ),
        ),
      ],
    );
  }
}

class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({required this.controller});

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) => Stack(
        children: <Widget>[
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 50),
            reverseDuration: const Duration(milliseconds: 200),
            child: controller.value.isPlaying
                ? const SizedBox.shrink()
                : Container(
                    color: Colors.black26,
                    child: const Center(
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 100,
                        semanticLabel: 'Play',
                      ),
                    ),
                  ),
          ),
          GestureDetector(
            onTap: () {
              controller.value.isPlaying
                  ? controller.pause()
                  : controller.play();
            },
          ),
        ],
      );
}
