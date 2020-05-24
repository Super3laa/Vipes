import 'dart:async';
import 'package:async_redux/async_redux.dart';
import 'package:captureit/AE/filterSelectedVideos.dart';
import 'package:captureit/AE/genToast.dart';
import 'package:captureit/Storage/generateFilm.dart';
import 'package:captureit/models/Actions/toggleViewMainpulation.dart';
import 'package:captureit/models/button.dart';
import 'package:captureit/models/film.dart';
import 'package:captureit/models/paths.dart';
import 'package:captureit/models/story.dart';
import 'package:flutter/material.dart';
import '../cameraStateRedux.dart';

class ToggleView extends ReduxAction<CameraState> {
  String data;
  dynamic context;
  ToggleView(this.data, this.context);
  @override
  Future<CameraState> reduce() async {
    if (data == 'merge') {
      //genToast(context, 'Select Stories to Merge');
      return CameraState(
          state.recordingState,
          state.selectedCameraIdx,
          Paths(
            state.paths.story,
            Film(state.paths.film.filmspath, state.paths.film.filmsThumbspath),
            state.paths.videosPath,
            true,
            Button('merge', Colors.yellow[700], Icons.check, 'notdone'),
          ));
    } else {
      
      List<String> selectedVideos = filterSelectedVideos(state.paths);
      if (selectedVideos.length > 0) {
        dispatch(ToggleViewManipulation());
        genToastLong(context, 'Your video will be generated soon');
        await generateFilm(selectedVideos);
      }
       return CameraState(
        state.recordingState,
        state.selectedCameraIdx,
        Paths(
          Story(
            state.paths.story.thumbsPath,
            state.paths.story.selected,
          ),
          Film(
            state.paths.film.filmspath,
            state.paths.film.filmsThumbspath,
          ),
          state.paths.videosPath,
          false,
          Button('merge', Colors.red[500], Icons.camera_roll, 'merge'),
        ));
    }
  }
}
