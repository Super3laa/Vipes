import 'dart:io';

import 'package:captureit/Storage/getVipesDir.dart';

getFilmThumbs()async{
  String dir = await getVipesDir();
  final thumbDir = '$dir/films/Thumbs';
  await Directory(thumbDir).create(recursive: true);
  List thumbPaths= Directory(thumbDir).listSync(recursive: false);
  List<String> paths = [];
  for(var i in thumbPaths){
    paths.add(i.path);
  }
  return paths;
}