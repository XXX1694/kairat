import "package:flutter/material.dart";
import "package:youtube_player_flutter/youtube_player_flutter.dart";

class LiveStreamYoutube extends StatefulWidget {
  const LiveStreamYoutube({
    super.key,
    required this.videoId,
  });
  final String videoId;
  @override
  State<LiveStreamYoutube> createState() => _LiveStreamYoutubeState();
}

class _LiveStreamYoutubeState extends State<LiveStreamYoutube> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        isLive: true,
        mute: false,
        enableCaption: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
          ),
        ),
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ],
    );
  }
}
