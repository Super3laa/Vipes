import 'package:camera/camera.dart';

cameraStart(CameraDescription cameraDescription,CameraController controller) async {
    if (controller != null) {
       await controller.dispose();
    }
    controller = CameraController(cameraDescription, ResolutionPreset.high,enableAudio: true);
    try {
      await controller.initialize();
    } on CameraException catch (e) {
      print(e);
    }
    return controller;  
  }
