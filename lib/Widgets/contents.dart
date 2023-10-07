//the contents that needs to be displayed in the applicaton
import 'package:flutter/material.dart';
import 'package:se/bookPage.dart';

Widget contents(BuildContext context, String strimg, String strdesc,
    String planetName, String plntimg, plntdesc) {
  return InkWell(
    onTap: () {
      bookingInterface(
        context,
        plntimg,
        plntdesc,
        planetName,
      );
    },
    child: Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 10,
        ),
        Center(
          child: Text(
            planetName,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 25,
        ),
        Container(
          height: MediaQuery.of(context).size.height / 3.5,
          decoration: BoxDecoration(color: Colors.transparent),
          child: Center(child: Image.asset(strimg)),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 60,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height / 3,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.transparent),
            child: SingleChildScrollView(
              child: Center(
                  child: Text(
                strdesc,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              )),
            ),
          ),
        )
      ],
    ),
  );
}

void bookingInterface(BuildContext context, String plntimg, String plntdesc,
    String planetName) async {
  showModalBottomSheet(
    
      isScrollControlled: true,
      isDismissible: true,
      context: context,
      backgroundColor: Color.fromRGBO(12, 19, 79, 1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
            expand: false,
            minChildSize: 0.5,
            maxChildSize: 0.9,
            initialChildSize: 0.75,
            builder: (BuildContext context, controller) {
              return Container(
                  child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 20,
                      ),
                      Text(
                        planetName,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 550,
                      ),
                      Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 800,
                          width: MediaQuery.of(context).size.width / 5,
                          decoration: BoxDecoration(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height/3.5,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50)),
                          child: Image.asset(plntimg),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 60,
                      ),
                      Container(
                        child: Center(
                            child: Text(
                          plntdesc,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        )),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height/40,
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>const bookPage()));
                        },
                        child: Container(
                          
                          height: MediaQuery.of(context).size.height/20,
                          width: MediaQuery.of(context).size.width/2.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Color.fromRGBO(87, 108, 188 ,1)
                          ),
                          child: Center(
                            child: Text('Book Now',style: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                            ),),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height/15,
                      )
                    ],
                  ),
                ),
              ));
            });
      });
}
