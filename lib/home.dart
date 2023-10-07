import 'package:flutter/material.dart';
import 'package:se/bookPage.dart';

import 'package:se/homescreen.dart';
import 'package:video_player/video_player.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late VideoPlayerController cntrl;

  @override
  void initState() {
    super.initState();
    cntrl = VideoPlayerController.asset('lib/assets/MOBILE-Space.mp4')
      ..initialize().then((_) {
        setState(() {});
        cntrl.play();
        cntrl.setLooping(true);
        cntrl.setVolume(0.0);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
        },
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final screenWidth = constraints.maxWidth;
            final screenHeight = constraints.maxHeight;

            return Container(
              width: screenWidth,
              height: screenHeight,
              child: Stack(
                children: [
                  Center(
                    child: cntrl.value.isInitialized
                        ? Container(
                            width: screenWidth,
                            height: screenHeight,
                            child: VideoPlayer(cntrl),
                          )
                        : Container(),
                  ),
                  SafeArea(
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: screenHeight / 3.5,
                          ),
                          Text(
                            'Space Elevator',
                            style: TextStyle(
                              fontSize: screenWidth * 0.1,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    cntrl.dispose();
    super.dispose();
  }
}
