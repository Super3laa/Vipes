import 'package:async_redux/async_redux.dart';
import 'package:captureit/UI/secondaryScreens/startRecording.dart';
import 'package:captureit/UI/widgets/cardVideo.dart';
import 'package:captureit/models/Actions/getFilmInfo.dart';
import 'package:captureit/models/cameraStateRedux.dart';
import 'package:captureit/models/film.dart';
import 'package:flutter/material.dart';

class FilmScreen extends StatefulWidget {
  @override
  FilmScreenState createState() => FilmScreenState();
}

class FilmScreenState extends State<FilmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(int.parse('0xFF121111')),
        child:StoreConnector<CameraState, Film>(
        builder: (context, film) {
          if (film.filmsThumbspath.length <= 0) {
            return StartRecording();
          } else {
            return Stack(
              children: [
                GridView.builder(
                  itemCount: film.filmsThumbspath.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 9 / 16),
                  itemBuilder: (BuildContext context, int index) {
                    return CardVideo(index, film.filmsThumbspath,film.filmspath,'film');
                  },
                ),
              ],
            );
          }
        },
        converter: (store) => store.state.paths.film,
        onInit: (store) => store.dispatch(GetFilmInfo()),
      ),),
    );
  }
}
