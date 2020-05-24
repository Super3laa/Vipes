import 'dart:async';
import 'package:async_redux/async_redux.dart';
import 'package:captureit/models/button.dart';
import 'package:captureit/models/film.dart';
import 'package:captureit/models/paths.dart';
import 'package:captureit/models/story.dart';
import 'package:flutter/material.dart';
import '../cameraStateRedux.dart';

class ToggleViewManipulation extends ReduxAction<CameraState> {
  @override
  Future<CameraState> reduce() async {
    return CameraState(
        state.recordingState,
        state.selectedCameraIdx,
        Paths(
          Story(
            state.paths.story.thumbsPath,
            List<Color>.filled(
              state.paths.story.thumbsPath.length,
              Colors.grey,
              growable: true,
            ),
          ),
          Film(
            state.paths.film.filmspath,
            state.paths.film.filmsThumbspath,
          ),
          state.paths.videosPath,
          false,
          Button('merge', Colors.red[500], Icons.camera_roll, 'done'),
        ));
  }
}
