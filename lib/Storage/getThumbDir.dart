

import 'package:captureit/Storage/getVipesDir.dart';

Future<String> getThumbDirectoryFolder() async {
 String dir = await getVipesDir();
  final thumbDir = '$dir/vibes/Thumbs';
  return thumbDir;
}
