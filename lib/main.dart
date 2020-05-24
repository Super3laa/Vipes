import 'dart:io';

import 'package:async_redux/async_redux.dart';
import 'package:camera/camera.dart';
import 'package:captureit/UI/screens/filmsScreen.dart';
import 'package:captureit/UI/screens/home.dart';
import 'package:captureit/UI/screens/infoScreen.dart';
import 'package:captureit/models/RecordingState.dart';
import 'package:captureit/models/button.dart';
import 'package:captureit/models/film.dart';
import 'package:captureit/models/story.dart';
import 'package:captureit/models/cameraStateRedux.dart';
import 'package:captureit/models/paths.dart';
import 'package:flutter/material.dart';
import 'models/cameraStateRedux.dart';

List<CameraDescription> cameras;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  availableCameras().then((availableCameras) {
    cameras = availableCameras;
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static CameraController cameraController;
  final store =Store<CameraState>(
    initialState:new CameraState(
      RecordingState(cameraController,'Record'), 0,Paths(Story([],[]),Film([],[]),[],false,Button('merge', Colors.red[500], Icons.camera_roll, 'merge'),))
      );
  Widget build(BuildContext context) {
    return StoreProvider<CameraState>(
      store: store,
      child: new MaterialApp(
        title: 'Vibes',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        routes:{
          '/': (context) => HomePage(),
          '/info':(context)=> InfoScreen(),
          '/films':(context)=> FilmScreen(),
        }
      ),
    );
  }
}
