import 'package:camera/camera.dart';

cameraSwitched(CameraDescription cameraDescription,CameraController controller) async {
    if (controller != null) {
       await controller.dispose();
    }
    controller = CameraController(cameraDescription, ResolutionPreset.max,enableAudio: true);
    try {
      await controller.initialize();
    } on CameraException catch (e) {
      print(e);
    }
    return controller;  
  }
