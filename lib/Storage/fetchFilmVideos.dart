import 'dart:io';
import 'package:captureit/Storage/getVipesDir.dart';

getFilmVideos()async{
  String dir = await getVipesDir();
  final videoDir = '$dir/films';
  await Directory(videoDir).create(recursive: true);
  List videoPaths= Directory(videoDir).listSync(recursive: false);
  List<String> paths = [];
  for(var i in videoPaths){
    if(i is File){
      paths.add(i.path);
    }
  }
  return paths;
}