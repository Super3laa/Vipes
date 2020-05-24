import 'dart:async';
import 'package:async_redux/async_redux.dart';
import 'package:captureit/Storage/fetchFilmThumbs.dart';
import 'package:captureit/Storage/fetchFilmVideos.dart';
import 'package:captureit/models/film.dart';
import 'package:captureit/models/paths.dart';
import '../cameraStateRedux.dart';
class GetFilmInfo extends ReduxAction<CameraState>{
  @override
  Future<CameraState> reduce() async {
    List<String> lsT=  await getFilmThumbs();
    List<String> lsV = await getFilmVideos();
    return CameraState(state.recordingState,state.selectedCameraIdx,
    Paths(
      state.paths.story,
      Film(
        lsV,lsT,
      ),
      state.paths.videosPath,
      state.paths.selected,
      state.paths.buttonMode));
  }
}
