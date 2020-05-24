import 'dart:io';
import 'package:async_redux/async_redux.dart';
import 'package:captureit/models/Actions/updateStory.dart';
import 'package:captureit/models/cameraStateRedux.dart';
import 'package:captureit/models/paths.dart';
import 'package:flutter/material.dart';

class CardVideoSelectionMode extends StatefulWidget {
  final int index;
  final Paths paths;
  CardVideoSelectionMode(this.index, this.paths);
  @override
  CardVideoSelectionModeState createState() => CardVideoSelectionModeState();
}

class CardVideoSelectionModeState extends State<CardVideoSelectionMode> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<CameraState, Store>(
        builder: (context, store) {
      return GestureDetector(
        onTapDown:((v){store.dispatch(UpdateStory(widget.index));}), 
        child: Card(
          color: Colors.black87,
          child: GridTile(
            header: GridTileBar(
              leading: Icon(Icons.check_circle_outline,
                  color: widget.paths.story.selected[widget.index]),
            ),
            child: Container(
              child: SizedBox.expand(
                child: Image.file(
                  new File(widget.paths.story.thumbsPath[widget.index]),
                ),
              ),
            ),
          ),
        ),
      );
    },converter: (store)=>store,
    );
  }
}
