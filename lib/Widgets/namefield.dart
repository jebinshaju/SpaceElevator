import 'package:flutter/material.dart';

Widget namefield(BuildContext context, TextEditingController nameController) {
  final borderColor = BoxDecoration(
    color: Colors.transparent,
    borderRadius: BorderRadius.circular(20),
  );

  return Container(
    height: MediaQuery.of(context).size.height / 20,
    width: MediaQuery.of(context).size.width / 1.1,
    decoration: BoxDecoration(
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
    ),
    child: Container(
      decoration: borderColor, // Apply the gradient to the border
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 3, 3),
        child: TextField(
          controller: nameController,
          decoration: InputDecoration(
            hintText: 'Enter Your Name',
            hintStyle: TextStyle(color: Colors.black),
            border: InputBorder.none,
          ),
        ),
      ),
    ),
  );
}
