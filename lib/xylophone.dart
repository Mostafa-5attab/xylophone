import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class xylophone extends StatelessWidget {

  void sound(int numberSound) {
    var path = AssetSource("note${numberSound}.wav");
    AudioPlayer audioPlayer = AudioPlayer();
    audioPlayer.play(path);
  }

  Expanded buildKey(int numberSound , Color color) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          sound(numberSound);
        },
        child: Container(
          color: color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            buildKey(1, Colors.black),
            buildKey(2, Colors.white),
            buildKey(3, Colors.black),
            buildKey(4, Colors.white),
            buildKey(5, Colors.black),
            buildKey(6, Colors.white),
            buildKey(7, Colors.black),
            buildKey(1, Colors.white),
            buildKey(2, Colors.black),
            buildKey(3, Colors.white),
            buildKey(5, Colors.black),
            buildKey(6, Colors.white),
            buildKey(7, Colors.black),
            buildKey(8, Colors.white),
            buildKey(1, Colors.black),
            buildKey(2, Colors.white),
            buildKey(3, Colors.black),
            buildKey(4, Colors.white),
            buildKey(5, Colors.black),
            //TODO mostafa khattab best in world
          ],
        ),
      ),
    );
  }
}
