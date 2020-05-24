import 'package:captureit/models/RecordingState.dart';
import 'package:captureit/models/paths.dart';

class CameraState{
  RecordingState recordingState;
  int selectedCameraIdx;
  Paths paths;  
  CameraState(this.recordingState,this.selectedCameraIdx,this.paths);
}



