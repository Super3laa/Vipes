import 'package:captureit/UI/secondaryScreens/loading.dart';
import 'package:captureit/UI/widgets/Camera.dart';
import 'package:captureit/UI/widgets/cameraButton.dart';
import 'package:captureit/UI/widgets/cameraSwitch.dart';
import 'package:captureit/models/Actions/cameraStart.dart';
import 'package:captureit/models/RecordingState.dart';
import 'package:captureit/models/cameraStateRedux.dart';
import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';

class VideoRecordingTab extends StatefulWidget {
  @override
  VideoRecordingTabState createState() => VideoRecordingTabState();
}

class VideoRecordingTabState extends State<VideoRecordingTab> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<CameraState, RecordingState>(
        builder: (context, recordingState) {
          if (recordingState.controller== null || !recordingState.controller.value.isInitialized) {
            return Loading();
          } else {
            return Stack(
              overflow: Overflow.visible,
              children: [
                CameraWidg(recordingState.controller),
                CameraButton(),
                CameraSwitchButton(),
              ],
            );
          }
        },
        onInit: (store) => store.dispatch(CameraStart()),
        converter: (store) => store.state.recordingState);
  }
}
