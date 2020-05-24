import 'package:flutter/material.dart';

class StartRecording extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(int.parse('0xFF121111')),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Image.asset('assets/images/Vibes.png', fit: BoxFit.fitWidth),
          ),
          Text('Start Recording Awesome Vipes',
              style: TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
