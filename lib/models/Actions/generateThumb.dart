import 'dart:async';
import 'package:async_redux/async_redux.dart';
import 'package:captureit/Storage/generateThumb.dart';
import 'package:captureit/Storage/getThumbDir.dart';
import '../cameraStateRedux.dart';
class GenerateThumb extends ReduxAction<CameraState>{
  final String videoDir;
  GenerateThumb(this.videoDir);
  @override
  Future<CameraState> reduce() async {
    final String thumbDir = await getThumbDirectoryFolder();
    await generateThumb(videoDir,thumbDir);
    return null;
  }
}
