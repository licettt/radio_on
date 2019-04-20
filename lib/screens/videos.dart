import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutube/flutube.dart';

void main() => runApp(videos());

class videos extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<videos> {
  final List<String> playlist = <String>[
    'https://www.youtube.com/watch?v=7hFQC3nmm2c&t=0s',
    'https://www.youtube.com/watch?v=D-o4BqJxmJE',
  ];
  int currentPos;
  String stateText;

  @override
  void initState() {
    currentPos = 0;
    stateText = "Video not started";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FluTube Test'),
      ),
      body: SingleChildScrollView(

        child: Column(
          children: <Widget>[
            Text('Youtube video URL: ${playlist[currentPos]}', style: TextStyle(fontSize: 16.0),),
            FluTube(
              playlist[currentPos],
              autoInitialize: true,
              aspectRatio: 16 / 9,
              allowMuting: false,
              onVideoStart: () {
                setState(() {
                  stateText = 'Video started playing!';
                });
              },
              onVideoEnd: () {
                setState(() {
                  stateText = 'Video ended playing!';
                  if((currentPos + 1) < playlist.length)
                    currentPos++;
                });
              },
            ),
            Text(stateText),
          ],
        ),
      ),
    );
  }
}