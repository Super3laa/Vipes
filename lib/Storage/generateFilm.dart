import 'dart:io';
import 'package:captureit/AE/generateCommand.dart';
import 'package:captureit/Storage/generateThumb.dart';
import 'package:captureit/Storage/getVipesDir.dart';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';

generateFilm(List<String> selectedVideos) async {
  String dir = await getVipesDir();
  final String filmDirectory = '$dir/films';
  await Directory(filmDirectory).create(recursive: true);
  final String filmThumbDirectory = '$dir/films/Thumbs';
  await Directory(filmThumbDirectory).create(recursive: true);
  final String currentTime = DateTime.now().millisecondsSinceEpoch.toString();
  final String finaldir = '$filmDirectory/$currentTime';
  final FlutterFFmpeg _ffmpeg = new FlutterFFmpeg();
  String command = generateCommand(selectedVideos, finaldir);
  var status ;
   await _ffmpeg.execute(command).then((v){status = v;});
  print(status);
  if (status==0){
  await generateThumb('$finaldir.mp4', '$filmThumbDirectory');
  return 0;
  }else{
    return 1;
  }
}
