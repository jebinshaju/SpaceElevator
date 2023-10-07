import 'package:flutter/material.dart';

Widget lift(BuildContext context){
  return Column(
    children: [
      Container(
        height: MediaQuery.of(context).size.height/64,
        width: MediaQuery.of(context).size.width/2.5,
        color: Colors.red,
      ),
      
       
    ],
  );
}