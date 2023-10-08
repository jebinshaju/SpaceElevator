import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:se/Widgets/ageAnddateField.dart';
import 'package:se/Widgets/namefield.dart';
import 'package:se/homescreen.dart';
import 'package:video_player/video_player.dart';

class bookPage extends StatefulWidget {
  const bookPage({super.key});

  @override
  State<bookPage> createState() => _bookPageState();
}

class _bookPageState extends State<bookPage> {
  late VideoPlayerController cntrl3;
  TextEditingController dateController = TextEditingController();
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    cntrl3 = VideoPlayerController.asset('lib/assets/bookPageBackground.mp4')
      ..initialize().then((_) {
        setState(() {});
        cntrl3.play();
        cntrl3.setLooping(true);
        cntrl3.setVolume(0.0);
      });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor:
                Colors.white, // Your primary color // Your accent color
            colorScheme: ColorScheme.light(
                primary: Colors.blue), // Your primary color again
            buttonTheme: ButtonThemeData(
                textTheme: ButtonTextTheme.normal,
                highlightColor: Colors.white,
                buttonColor: Colors.white),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
        dateController.text = DateFormat('yyyy-MM-dd').format(selectedDate!);
      });
    }
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
                  child: cntrl3.value.isInitialized
                      ? Container(
                          width: screenWidth,
                          height: screenHeight,
                          child: VideoPlayer(cntrl3),
                        )
                      : Container(),
                ),
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 4,
                      ),
                      namefield(context),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 44,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 5.5,
                          ),
                          ageDate(context),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 4,
                          ),
                          // Date input field
                          Container(
                            height: MediaQuery.of(context).size.height / 20,
                            width: MediaQuery.of(context).size.width / 3.5,
                            decoration: BoxDecoration(
                             gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Colors.white60,
                                Colors.white12
                              ]),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 2,
                                color: Color.fromRGBO(
                                  47,
                                  88,
                                  205,
                                  1,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: TextField(
                                controller: dateController,
                                keyboardType: TextInputType
                                    .number, // Numeric keyboard type
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Date',
                                    hintStyle: TextStyle(color: Colors.white)),
                                onTap: () {
                                  _selectDate(context);
                                },
                                readOnly: true,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 35,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => SplashScreen(),
                            ),
                          );
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height / 20,
                          width: MediaQuery.of(context).size.width / 2.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: Color.fromRGBO(87, 108, 188, 1)),
                          child: Center(
                            child: Text(
                              'Confirm',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Delay navigation to the new page for 2 seconds (adjust as needed)
    Future.delayed(
      Duration(seconds: 2),
      () {
        // Navigate to the new page after the delay
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      },
    );

    // Your splash screen UI goes here
    return Scaffold(
      body: Center(
          child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(109, 103, 228, 1)),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.4,
              ),
              Text(
                "Congratulations",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              Text(
                "The Booking Has been Confirmed",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, color: Colors.white),
              )
            ],
          ),
        ),
      ) // Example: Show a loading indicator
          ),
    );
  }
}
