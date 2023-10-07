import 'package:flutter/material.dart';

Widget namefield(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height / 20,
    width: MediaQuery.of(context).size.width / 1.1,
    decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
            width: 2,
            color: Color.fromRGBO(
              47,
              88,
              205,
              1,
            ))),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 3, 3),
              child: TextField(

                decoration: InputDecoration(
                  hintText: 'Enter Your Age',
                  hintStyle: TextStyle(
                    color: Colors.white
                  ),
                  border: InputBorder.none
                ),
              ),
            ),
  );
}
