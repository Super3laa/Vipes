import 'dart:io';

deleteFile(String path){
  final dir = Directory(path);
  dir.deleteSync(recursive:true);
}