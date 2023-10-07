//the Video Interface while Starting the Application

import 'package:flutter/material.dart';
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
  void initState(){
    super.initState();
    cntrl = VideoPlayerController.asset('lib/assets/MOBILE-Space.mp4')
    ..initialize().then((_){
      setState(() {
        
      });
      cntrl.play();
      cntrl.setLooping(true);
      cntrl.setVolume(0.0);
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: 
      InkWell(
        onTap: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=> HomeScreen()));
        },
        child: Container(
          child: Stack(
            children: [
              Center(
                child: cntrl.value.isInitialized? AspectRatio(  
                aspectRatio: 0.489,
                child: VideoPlayer(cntrl),
                ):Container(),
              ),
              SafeArea(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height/3.5,
                      )
                      ,Text('Space Elevator',style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold 
                      ),)
                    ],
                  )
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}