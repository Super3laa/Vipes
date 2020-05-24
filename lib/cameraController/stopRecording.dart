import 'package:camera/camera.dart';
import 'package:captureit/Storage/generateThumb.dart';
import 'package:captureit/Storage/getThumbDir.dart';
import 'package:captureit/cameraController/startRecording.dart';
import 'package:flutter_video_compress/flutter_video_compress.dart';

stopRecording(CameraController controller) async {
  if (!controller.value.isRecordingVideo) {
    return controller;
  }
  try {
    await controller.stopVideoRecording();
    final String thumbDir = await getThumbDirectoryFolder();
    await generateThumb(videoPath, thumbDir);

    final _flutterVideoCompress = FlutterVideoCompress();
   var comp= await _flutterVideoCompress.compressVideo(
      videoPath,
      quality:VideoQuality.HighestQuality, 
      deleteOrigin: true,
    );
print(comp.toJson());
    return controller;
  } catch (e) {
    print(e);
    return null;
  }
}
