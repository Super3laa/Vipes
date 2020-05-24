import 'dart:async';
import 'package:async_redux/async_redux.dart';
import '../cameraStateRedux.dart';

class Refresh extends ReduxAction<CameraState>{
  @override
  Future<CameraState> reduce() async {
    return CameraState(state.recordingState,state.selectedCameraIdx,state.paths);
  }
}
