import 'package:disaster_notifier/pages/video_palyer.dart';
import 'package:flutter/material.dart';

class SafetyTips extends StatelessWidget {
  const SafetyTips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Safety Tips")),
      body: Column(children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) => const TipsPlayer(
                    videoUrl: "https://www.youtube.com/watch?v=b6Xah-vKYkg"))));
          },
          child: const ListTile(
            leading: Icon(Icons.warning_amber),
            title: Text("During a Cyclone"),
            trailing: Icon(Icons.play_arrow),
          ),
        )
      ]),
    );
  }
}
