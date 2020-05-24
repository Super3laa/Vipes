import 'package:captureit/AE/genToast.dart';
import 'package:captureit/cameraController/stopRecording.dart';
import 'dart:async';
import 'package:async_redux/async_redux.dart';
import 'package:captureit/models/RecordingState.dart';
import '../cameraStateRedux.dart';
import 'package:camera/camera.dart';
class StopRecording extends ReduxAction<CameraState>{
  dynamic context;
  StopRecording(this.context);
  @override
  Future<CameraState> reduce() async {
    CameraController controllerS =  await stopRecording(state.recordingState.controller);
    genToastMed(context,'Recorded');
    return CameraState(RecordingState(controllerS,'Record'),state.selectedCameraIdx,state.paths);
  }
}
