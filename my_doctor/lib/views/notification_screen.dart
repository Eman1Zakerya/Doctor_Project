import 'package:flutter/material.dart';
import 'package:my_doctor/core/constants.dart';

class NotificationScreen  extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,

      body: Column(
        children: [
          Center(
            child: Card(
              elevation: 3,
              child: Container(
                width: double.infinity,
                height: 100,
                color: Colors.white,
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('Lorem ipsum is placeholder text commonly used in the graphic, '
                      'print, and publishing industries for previewing layouts and visual mockups.'),
                ),

              ),
            ),
          ),
          Center(
            child: Card(
              elevation: 3,
              child: Container(
                width: double.infinity,
                height: 100,
                color: Colors.white,
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('Lorem ipsum is placeholder text commonly used in the graphic, '
                      'print, and publishing industries for previewing layouts and visual mockups.'),
                ),

              ),
            ),
          ),
          Center(
            child: Card(
              elevation: 3,
              child: Container(
                width: double.infinity,
                height: 100,
                color: Colors.white,
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('Lorem ipsum is placeholder text commonly used in the graphic, '
                      'print, and publishing industries for previewing layouts and visual mockups.'),
                ),

              ),
            ),
          ),
        ],
      ),
    );
  }
}
