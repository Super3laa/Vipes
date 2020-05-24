import 'package:captureit/cameraController/startRecording.dart';
import 'dart:async';
import 'package:async_redux/async_redux.dart';
import 'package:captureit/models/RecordingState.dart';
import '../cameraStateRedux.dart';
import 'package:camera/camera.dart';

class StartRecording extends ReduxAction<CameraState> {
  @override
  Future<CameraState> reduce() async {
    CameraController controllerS =await startRecording(state.recordingState.controller);
    return CameraState(
      RecordingState(controllerS, 'Stop'),
      state.selectedCameraIdx,
      state.paths,
    );
  }
}
