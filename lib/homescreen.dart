//main page of the Application where parallaxproperties are added

import 'package:flutter/material.dart';
import 'package:se/Widgets/contents.dart';
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
      body: LayoutBuilder(
        builder: (BuildContext context , BoxConstraints constraints) {
          final screenWidth = constraints.maxWidth;
            final screenHeight = constraints.maxHeight;
          return Container(
            height: screenHeight,
            width: screenWidth,
            child: Stack(
              children: [
                
                Center(
                    child: cntrl1.value.isInitialized? Container(
                    width: screenWidth,
                    height: screenHeight,  
                    child: VideoPlayer(cntrl1)):Container(),
                ),
                ElevatorApp()
              ],
            ),
          );
        }
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
      itemCount: 10, // Replace with the number of floors in your elevator.
      itemBuilder: (BuildContext context, int index) {
        return contents(context,'lib/assets/Picsart_23-10-06_22-56-38-205.png','Hello');
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}