import 'dart:async';
import 'package:async_redux/async_redux.dart';
import 'package:captureit/AE/genToast.dart';
import 'package:captureit/models/Actions/startRecording.dart';
import 'package:captureit/models/Actions/stopRecording.dart';
import '../cameraStateRedux.dart';

class TimerFire extends ReduxAction<CameraState> {
  dynamic context;
  TimerFire(this.context);
  @override
  Future<CameraState> reduce() async {
    dispatch(StartRecording());
    genToastMed(context,'Action');
    await  Future.delayed(const Duration(seconds: 5),(){});
    dispatch(StopRecording(context));
    return CameraState(state.recordingState,state.selectedCameraIdx,state.paths);
  }
}
