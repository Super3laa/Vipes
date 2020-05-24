import 'dart:io';
import 'package:captureit/Storage/getVipesDir.dart';
import 'package:path_provider/path_provider.dart';

getVideos()async{
  Directory dircom = await getExternalStorageDirectory();
  print(dircom);
  final videoDir = '${dircom.path}/flutter_video_compress';
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