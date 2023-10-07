//main page of the Application where parallaxproperties are added

import 'package:flutter/material.dart';
import 'package:se/assets/contents.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   late VideoPlayerController cntrl1;
   
   @override
  void initState(){
    super.initState();
    cntrl1 = VideoPlayerController.asset('lib/assets/background.mp4')
    ..initialize().then((_){
      setState(() {
        
      });
      cntrl1.play();
      cntrl1.setLooping(true);
      cntrl1.setVolume(0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Center(
                child: cntrl1.value.isInitialized? AspectRatio(  
                aspectRatio: 0.489,
                child: VideoPlayer(cntrl1),
                ):Container(),
            )
          ],
        ),
      ),
    );
  }
}

class ElevatorApp extends StatefulWidget {
  @override
  _ElevatorAppState createState() => _ElevatorAppState();
}

class _ElevatorAppState extends State<ElevatorApp> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // Add a post-frame callback to scroll to the bottom immediately after the build is complete.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      reverse: false, // Reverse the list so it starts at the bottom.
      itemCount: 50, // Replace with the number of floors in your elevator.
      itemBuilder: (BuildContext context, int index) {
        return contents(context);
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}