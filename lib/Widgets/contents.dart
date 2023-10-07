//the contents that needs to be displayed in the applicaton

import 'package:flutter/material.dart';

Widget contents(BuildContext context ,String strimg , String strdesc ){
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
        child: Center(child: Image.asset(strimg)),
      ),
      Container(
        height: MediaQuery.of(context).size.height/2.5,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent
        ),
        child: Center(child: Text(strdesc,style: TextStyle(
          color: Colors.white
        ),)),
      )
    ],
  );
}