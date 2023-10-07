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
  void initState() {
    super.initState();
    cntrl1 = VideoPlayerController.asset('lib/assets/background.mp4')
      ..initialize().then((_) {
        setState(() {});
        cntrl1.play();
        cntrl1.setLooping(true);
        cntrl1.setVolume(0.0);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        final screenWidth = constraints.maxWidth;
        final screenHeight = constraints.maxHeight;
        return Container(
          height: screenHeight,
          width: screenWidth,
          child: Stack(
            children: [
              Center(
                child: cntrl1.value.isInitialized
                    ? Container(
                        width: screenWidth,
                        height: screenHeight,
                        child: VideoPlayer(cntrl1))
                    : Container(),
              ),
              ElevatorApp()
            ],
          ),
        );
      }),
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
    List<List<String>> planetlis = [
      ["lib/assets/neptune.png", "this is Neptune", "Neptune"],
      ["lib/assets/uranus.png", "this is uranus", "uranus"],
      ["lib/assets/saturn.png", "this is Saturn", "Saturn"],
      ["lib/assets/jupiter.png", "this is Jupiter", "Jupiter"],
      [
        "lib/assets/mars.png",
        "This is Mars",
        "Mars",
      ],
      [
        "lib/assets/earth.png",
        "Discover Earth's Majesty: Our space tour showcases stunning natural wonders, vibrant cityscapes, and diverse life forms, fostering a deep appreciation for our precious planet.",
        "EARTH",
      ],
      [
        "lib/assets/venus.png",
        "This is Venus",
        "Venus",
      ],
      [
        "lib/assets/mercury.png",
        "This is Mercury",
        "Mercury",
      ]
    ];

    List<List<String>> planetDesc = [
      [
        "lib/assets/neptune.png",
        "this is Jupiter",
      ],
      [
        "lib/assets/uranus.png",
        "this is uranus",
      ],
      [
        "lib/assets/saturn.png",
        "this is Jupiter",
      ],
      ["lib/assets/jupiter.png", "this is Jupiter"],
      [
        "lib/assets/mars.png",
        "This is Mars",
      ],
      [
        "lib/assets/earth2.jpg",
        "\n\nExplore the Jewel of the Cosmos - Earth\n\nWelcome to an unparalleled journey that takes you to the most "
            "exquisite destination in the universe – our very own planet, Earth. As you embark on this extraordinary"
            " adventure with our space travel agency, you'll encounter the beauty, diversity, and wonder that our planet offers.\n\n"
            "Astonishing Natural Wonders\n\n"
            "Our home planet is adorned with breathtaking natural wonders, from the towering peaks of the Himalayas to the lush "
            "rainforests of the Amazon. Experience the awe-inspiring beauty of these landscapes from space, where you can witness the"
            " vibrant colors and intricate details of our world.\n\n"
            "Mesmerizing Aerial Views\n\n"
            "On your journey, you'll have the chance to observe Earth's captivating vistas from orbit. Gaze in wonder at the vast deserts,"
            " meandering rivers, and sprawling cityscapes. Witness the changing seasons as they sweep across continents, painting the Earth in"
            " a mosaic of colors.\n\n"
            "Biodiversity Extravaganza\n\n"
            "Earth is teeming with life in all its forms. Observe the diverse ecosystems, from the Great Barrier Reef's underwater wonderland to"
            " the African savannah's majestic wildlife. As you orbit our planet, you'll gain a newfound appreciation for the delicate balance of"
            " life on Earth\n\n"
            "Human Achievement and Innovation\n\n"
            "Marvel at the lights of cities, a testament to human innovation and progress. See the Great Wall of China, the Pyramids of Giza,"
            " and other iconic landmarks from space. Our planet's history and cultures are written across its landscapes\n\n"
            "A Fragile Oasis\n\n"
            "As you journey through space, you'll come to understand the importance of preserving our fragile oasis. Earth is a precious jewel in the vast cosmos, "
            "and it's our responsibility to protect and cherish it for generations to come\n\n"
            "Unforgettable Experience\n\n"
            "This space travel adventure is not just a trip; it's a transformative experience that will forever change your perspective. Witness the fragility and"
            " resilience of Earth from the unique vantage point of space, and return with a profound connection to our planet\n\n"
            "Book Your Space Tour\n\n"
            "Don't miss the opportunity to embark on this once-in-a-lifetime journey to explore Earth from space. Contact our space travel agency to book your space"
            " tour today and join the ranks of those who have beheld the beauty of our extraordinary planet\n\n"
            "Experience Earth as you've never seen it before – from the cosmos. It's time to make your dream of space travel a reality\n\n",
      ],
      [
        "lib/assets/venus.png",
        "This is Venus",
      ],
      [
        "lib/assets/mercury.png",
        "This is Mercury",
      ]
    ];

    return ListView.builder(
      controller: _scrollController,
      reverse: false, // Reverse the list so it starts at the bottom.
      itemCount: planetDesc.length , // Replace with the number of floors in your elevator.
      itemBuilder: (BuildContext context, int index) {
        return contents(context, planetlis[index][0], planetlis[index][1],
            planetlis[index][2], planetDesc[index][0], planetDesc[index][1]);
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
