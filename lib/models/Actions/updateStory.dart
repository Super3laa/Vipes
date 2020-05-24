import 'dart:async';
import 'package:async_redux/async_redux.dart';
import 'package:captureit/models/film.dart';
import 'package:captureit/models/paths.dart';
import 'package:captureit/models/story.dart';
import 'package:flutter/material.dart';
import '../cameraStateRedux.dart';
class UpdateStory extends ReduxAction<CameraState>{
  int index;
  UpdateStory(this.index);
  @override
  Future<CameraState> reduce() async {
    state.paths.story.selected[index] = (state.paths.story.selected[index] == Colors.grey) ? Colors.yellow[700] : Colors.grey;
    return CameraState(state.recordingState,state.selectedCameraIdx,
    Paths(
      Story(
        state.paths.story.thumbsPath,
        state.paths.story.selected,),
        Film(
              state.paths.film.filmspath,
              state.paths.film.filmsThumbspath,
            ),
      state.paths.videosPath,
      state.paths.selected,
      state.paths.buttonMode));
  }
}
