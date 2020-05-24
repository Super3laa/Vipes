import 'dart:async';
import 'package:async_redux/async_redux.dart';
import 'package:captureit/Storage/fetchThums.dart';
import 'package:captureit/Storage/fetchVideos.dart';
import 'package:captureit/models/paths.dart';
import 'package:captureit/models/story.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../cameraStateRedux.dart';
class GetStoryInfo extends ReduxAction<CameraState>{
  @override
  Future<CameraState> reduce() async {
    List<String> lsT=  await getThumbs();
    List<String> lsV = await getVideos();
    return CameraState(state.recordingState,state.selectedCameraIdx,
    Paths(
      Story(lsT,List<Color>.filled(lsT.length,Colors.grey, growable: true)),
      state.paths.film,
            lsV,
      state.paths.selected,
      state.paths.buttonMode));
  }
}
