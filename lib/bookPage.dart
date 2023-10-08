import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:se/Widgets/ageAnddateField.dart';
import 'package:se/Widgets/namefield.dart';
import 'package:se/homescreen.dart';
import 'package:video_player/video_player.dart';

class bookPage extends StatefulWidget {

final String dest;
  bookPage({super.key , required this.dest});

  @override
  State<bookPage> createState() => _bookPageState();
}

class _bookPageState extends State<bookPage> {
  late VideoPlayerController cntrl3;
  TextEditingController dateController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
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
            primaryColor: Colors.white,
            colorScheme: const ColorScheme.light(
                primary: Colors.blue),
            buttonTheme: const ButtonThemeData(
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
  Widget build(BuildContext context ) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final screenWidth = constraints.maxWidth;
          final screenHeight = constraints.maxHeight;
          return SizedBox(
            height: screenHeight,
            width: screenWidth,
            child: Stack(
              children: [
                Center(
                  child: cntrl3.value.isInitialized
                      ? SizedBox(
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
                      namefield(context, nameController),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 44,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 5.5,
                          ),
                          ageDate(context, agecontroller),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 4,
                          ),
                          // Date input field
                          Container(
                            height: MediaQuery.of(context).size.height / 20,
                            width: MediaQuery.of(context).size.width / 3.5,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [Colors.white60, Colors.white12]),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 2,
                                color: Colors.transparent,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                              child: TextField(
                                controller: dateController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Date',
                                    hintStyle: TextStyle(color: Colors.white)),
                                onTap: () {
                                  _selectDate(context);
                                  print(widget.dest.toString());
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
                          confirmbtn(context, nameController, agecontroller, dateController, widget.dest.toString()  );
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height / 20,
                          width: MediaQuery.of(context).size.width / 2.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                             gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                          Color.fromRGBO(255, 75, 145,1),
                          Color.fromRGBO(91, 8, 136,1)

                         ])),
                          child: const Center(
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

  void confirmbtn(
      BuildContext context,
      TextEditingController _control1,
      TextEditingController _control2,
      TextEditingController _date,
      String dest
      ) {
    if (_control1.text == '' ||
        _control2.text == '' ||
        _date.text == '') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(seconds: 1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
          elevation: 0,
          content: Container(
            child: Center(
              child: Text('Enter all the Specified Values'),
            ),
          )));
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => SplashScreen(
            nameController: nameController,
            Destination: dest ,
          ),
        ),
      );
    }
  }
}

class SplashScreen extends StatelessWidget {
  final TextEditingController nameController;
  final String Destination;
  SplashScreen({
    required this.nameController,
    required this.Destination
  });

  @override
  Widget build(BuildContext context) {
    // Delay navigation to the new page for 2 seconds (adjust as needed)
    
    Future.delayed(
      const Duration(seconds: 4),
      () {
        // Navigate to the new page after the delay
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
        );
      },
    );

    // Your splash screen UI goes here
    return Scaffold(
      body: Center(
          child: Container(
        decoration: const BoxDecoration(color: Colors.black),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.4,
              ),
              Text(
                "Congratulations \n${nameController.text}",textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              LoadingAnimationWidget.threeRotatingDots(
                  color: Colors.blue, size: 35),
              SizedBox(
                height: MediaQuery.of(context).size.height / 30,
              ),
              const Text(
                "The Booking Has been Confirmed",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 40,
              ),
              Text('The Destination is ${Destination}',
              textAlign: TextAlign.center
              ,style: TextStyle(
                fontSize: 28,
                color: Colors.white
              ),)
            ],
          ),
        ),
      ) // Example: Show a loading indicator
          ),
    );
  }
}
