import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(int.parse('0xFF121111')),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Icon(Icons.local_cafe, color: Colors.brown[400]),
          Text('Please wait, We are getting things done',
              style: TextStyle(color: Colors.grey[400], fontSize: 20),
              textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
