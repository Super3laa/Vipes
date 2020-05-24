import 'dart:io';
import 'package:captureit/Storage/getVipesDir.dart';

Future<String> getVideoDirectory() async {
  final String dir = await getVipesDir();
  final videoDirectory = '$dir/vibes';
  await Directory(videoDirectory).create(recursive: true);
  final String currentTime = DateTime.now().millisecondsSinceEpoch.toString();
  final String filePath = '$videoDirectory/$currentTime.mp4';
  return filePath;
}
