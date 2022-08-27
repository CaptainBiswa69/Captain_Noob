import 'package:disaster_notifier/pages/video_palyer.dart';
import 'package:flutter/material.dart';

class SafetyTips extends StatelessWidget {
  const SafetyTips({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Safety Tips")),
      body: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => const TipsPlayer(
                      videoUrl: "https://youtu.be/Li1ysRexTY8"))));
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.warning_amber),
                  title: Text("Cyclone preparation and safety"),
                  trailing: Icon(Icons.play_arrow),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => const TipsPlayer(
                      videoUrl: "https://youtu.be/cqCMXSOo8qc"))));
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.warning_amber),
                  title: Text("Flood safety tips"),
                  trailing: Icon(Icons.play_arrow),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => const TipsPlayer(
                      videoUrl: "https://youtu.be/MvcId4_UJuU"))));
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.warning_amber),
                  title: Text("Flash flood"),
                  trailing: Icon(Icons.play_arrow),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => const TipsPlayer(
                      videoUrl: "https://youtu.be/aEkAzbM4_HU"))));
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.warning_amber),
                  title: Text("Hurricane safety tips"),
                  trailing: Icon(Icons.play_arrow),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => const TipsPlayer(
                      videoUrl: "https://youtu.be/H6icWfyMBNk"))));
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.warning_amber),
                  title: Text("Severe weather safety tips"),
                  trailing: Icon(Icons.play_arrow),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => const TipsPlayer(
                      videoUrl: "https://youtu.be/OCjl6tp8dnw"))));
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.warning_amber),
                  title: Text("Ways to survive from natural disasters"),
                  trailing: Icon(Icons.play_arrow),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => const TipsPlayer(
                      videoUrl: "https://youtu.be/43M5mZuzHF8"))));
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.warning_amber),
                  title: Text("Prepare for flood"),
                  trailing: Icon(Icons.play_arrow),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => const TipsPlayer(
                      videoUrl: "https://youtu.be/hizBdM1Ob68"))));
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.warning_amber),
                  title: Text("How to do CPR"),
                  trailing: Icon(Icons.play_arrow),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => const TipsPlayer(
                      videoUrl: "https://youtu.be/8assGpZvwG4"))));
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.warning_amber),
                  title: Text("What should be in a first aid kit"),
                  trailing: Icon(Icons.play_arrow),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => const TipsPlayer(
                      videoUrl: "https://youtu.be/ApzANyz15KI"))));
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.warning_amber),
                  title: Text("First-aid tips - transport of the injured"),
                  trailing: Icon(Icons.play_arrow),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: ((context) => const TipsPlayer(
                      videoUrl: "https://youtu.be/apwK7Y362qU"))));
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.warning_amber),
                  title: Text("What to do in case of a fire"),
                  trailing: Icon(Icons.play_arrow),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
