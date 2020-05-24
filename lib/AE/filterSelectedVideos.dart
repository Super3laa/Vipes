import 'package:captureit/models/paths.dart';
import 'package:flutter/material.dart';

filterSelectedVideos(Paths paths) {
  List<String> v = paths.videosPath;
  List<Color> c = paths.story.selected;
  
  List<String> selectedVideos = [];
  for (var i = 0; i < v.length; i++) {
    if (c[i] != Colors.grey) {
      selectedVideos.add(v[i]);
    }
  }
  return selectedVideos;
}
