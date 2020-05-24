import 'dart:io';
import 'package:captureit/UI/screens/videoPlayingScreen.dart';
import 'package:captureit/UI/widgets/dropMenu.dart';
import 'package:captureit/models/paths.dart';
import 'package:flutter/material.dart';

class CardVideo extends StatefulWidget {
  final int index;
  final List<String> thumbs;
  final List<String> videos;
  String type ;
    CardVideo(this.index, this.thumbs,this.videos,this.type);
  @override
  _CardVideoState createState() => _CardVideoState();
}

class _CardVideoState extends State<CardVideo> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black87,
      child: GridTile(
        header: GridTileBar(
          leading: DropMenu(widget.thumbs[widget.index], widget.videos[widget.index],widget.type,widget.index),
        ),
        child: GestureDetector(
          onTapDown: ((v) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => (VideoPlayerScreen(
                        widget.videos[widget.index]))));
          }),
          child: Container(
            child: SizedBox.expand(
              child: Image.file(
                new File(widget.thumbs[widget.index]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
