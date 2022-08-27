import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TipsPlayer extends StatefulWidget {
  final String videoUrl;
  const TipsPlayer({Key? key, required this.videoUrl}) : super(key: key);

  @override
  State<TipsPlayer> createState() => _TipsPlayerState();
}

class _TipsPlayerState extends State<TipsPlayer> {
  late String url = widget.videoUrl;
  late YoutubePlayerController _controller;
  String? id;

  void runYoutubePlayer() {
    _controller = YoutubePlayerController(
        initialVideoId: id ?? "1KAv9jxNCr4",
        flags: const YoutubePlayerFlags(autoPlay: true, enableCaption: false));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    id = YoutubePlayer.convertUrlToId(url);
    runYoutubePlayer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    _controller.pause();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: _controller,
            aspectRatio: 16 / 9,
          ),
          builder: (context, player) {
            return Scaffold(
              body: player,
            );
          }),
    );
  }
}
