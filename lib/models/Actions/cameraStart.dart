import 'package:captureit/cameraController/cameraStart.dart';
import 'package:captureit/main.dart';
import 'dart:async';
import 'package:async_redux/async_redux.dart';
import 'package:captureit/models/RecordingState.dart';
import '../cameraStateRedux.dart';
import 'package:camera/camera.dart';
class CameraStart extends ReduxAction<CameraState>{
  @override
  Future<CameraState> reduce() async {
    int id = state.selectedCameraIdx;
    CameraController controllerS =  await cameraStart(cameras[id],state.recordingState.controller);
    return CameraState(RecordingState(controllerS,state.recordingState.recording),id,state.paths);
  }
}
