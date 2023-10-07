//the contents that needs to be displayed in the applicaton

import 'package:flutter/material.dart';

Widget contents(BuildContext context){
  return Column(
    children: [
      SizedBox(
        height: MediaQuery.of(context).size.height/64,
      )
      ,Container(
        height: MediaQuery.of(context).size.height/2.5,
        decoration: BoxDecoration(
          color: Colors.transparent
          
        ),
        child: Center(child: Image.asset('lib/assets/Picsart_23-10-06_22-56-38-205.png')),
      ),
      Container(
        height: MediaQuery.of(context).size.height/2.5,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent
        ),
        child: Center(child: Text('Example text')),
      )
    ],
  );
}