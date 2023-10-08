import 'package:flutter/material.dart';

Widget ageDate(BuildContext context, TextEditingController agecontroller) {
  final borderColor = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [Colors.white60, Colors.white12],
    ),
    borderRadius: BorderRadius.circular(20),
    border: Border.all(
      width: 2,
      color: Colors.transparent, // Set border color to transparent
    ),
  );

  return Container(
    height: MediaQuery.of(context).size.height / 20,
    width: MediaQuery.of(context).size.width / 5,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Colors.white60, Colors.white12],
      ),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Container(
      decoration: borderColor, // Apply the gradient to the border
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 3, 3, 3),
        child: TextField(
          controller: agecontroller,
          keyboardType: TextInputType.number, // Specify the numeric keyboard type
          decoration: InputDecoration(
            hintText: 'Age',
            hintStyle: TextStyle(color: Colors.black),
            border: InputBorder.none,
          ),
        ),
      ),
    ),
  );
}
