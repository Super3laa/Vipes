import 'dart:async';
import 'package:async_redux/async_redux.dart';
import 'package:captureit/Storage/deleteFile.dart';
import 'package:captureit/models/cameraStateRedux.dart';
import 'package:captureit/models/film.dart';
import 'package:captureit/models/paths.dart';
import 'package:captureit/models/story.dart';

class DeleteFile extends ReduxAction<CameraState> {
  String path;
  String pathtany;
  String type;
  int index;
  DeleteFile(this.path, this.pathtany, this.type, this.index);
  @override
  FutureOr<CameraState> reduce() {
    deleteFile(path);
    deleteFile(pathtany);
    if (type == "story") {
      state.paths.story.thumbsPath.removeAt(index);
      state.paths.videosPath.removeAt(index);
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
            state.paths.selected,
            state.paths.buttonMode,
          ));
    } else {
      state.paths.film.filmspath.removeAt(index);
      state.paths.film.filmsThumbspath.removeAt(index);
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
            state.paths.selected,
            state.paths.buttonMode,
          ));
    }
  }
}
