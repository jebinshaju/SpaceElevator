//the contents that needs to be displayed in the applicaton

import 'package:flutter/material.dart';

Widget contents(BuildContext context){
  return Column(
    children: [
      Container(
        height: MediaQuery.of(context).size.height/2.5,
        decoration: BoxDecoration(
          color: Colors.black
          
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height/60,
      ),
      Container(
        height: MediaQuery.of(context).size.height/2.5,
        decoration: BoxDecoration(
          color: Colors.black
        )
      )
    ],
  );
}