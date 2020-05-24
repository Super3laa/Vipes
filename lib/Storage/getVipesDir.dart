import 'package:ext_storage/ext_storage.dart';
import 'package:permission_handler/permission_handler.dart';

getVipesDir()async{
  await Permission.storage.request();
  final String dir = await ExtStorage.getExternalStorageDirectory();
  return '$dir/Vibes';
}