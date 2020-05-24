import 'package:camera/camera.dart';
import 'package:captureit/Storage/videoDirectory.dart';
String videoPath;
startRecording(CameraController controller) async {
  if (!controller.value.isInitialized) {return null;}
  try {
    videoPath = await getVideoDirectory();
    await controller.startVideoRecording(videoPath);
    print('started');
    return controller;
  } catch (e) {
    print(e);
    return null;
  }
}
