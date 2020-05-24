import 'package:captureit/models/button.dart';
import 'package:flutter/material.dart';

getButton(String data) {
  Color color;
  IconData icon;
  String state;
  if (data == 'ChangeCamera') {
    color = Colors.white;
    icon = Icons.camera_rear;
    data = 'ChangeCamera';
  } else if (data == 'Record') {
    color = Colors.red;
    icon = Icons.videocam;
    data = 'Record';
    state = 'refresh';
  } else if (data == 'Stop') {
    color = Colors.red[800];
    icon = Icons.stop;
    data = 'Stop';
    state = 'refresh';
  }
  return Button(data, color , icon, state);
}
