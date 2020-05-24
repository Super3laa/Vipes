import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child:
                  Image.asset('assets/images/Vibes.png', fit: BoxFit.fitWidth),
            ),
            Text(
                'Vipes application helps you capture some precious moments with your family and friends and collect these moments and convert them into a small movie.',
                style: TextStyle(color: Colors.white, fontSize: 18),
                textAlign: TextAlign.center),
                SizedBox(height: 15,),
            Text('© reserved to Alaa Essam',
                style: TextStyle(color: Colors.red, fontSize: 14),
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
