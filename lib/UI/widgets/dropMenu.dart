import 'dart:io';

import 'package:async_redux/async_redux.dart';
import 'package:captureit/models/Actions/deleteFile.dart';
import 'package:captureit/models/cameraStateRedux.dart';
import 'package:flutter/material.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';

class DropMenu extends StatefulWidget {
  final String thumb, video,type;
  final int index;
  DropMenu(this.thumb, this.video,this.type,this.index);
  @override
  _DropMenuState createState() => _DropMenuState();
}

class _DropMenuState extends State<DropMenu> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<CameraState, Store>(
      builder: (context, store) {
        return DropdownButton<String>(
            items: [
             DropdownMenuItem<String>(
                value: "Delete",
                child: SizedBox.shrink(
                    child: Icon(Icons.delete, color: Colors.red)),
              ),
               DropdownMenuItem<String>(
                value: "share",
                child: SizedBox.shrink(
                    child: Icon(Icons.share, color: Colors.red)),
              ),
            ],
            onChanged: (value) async {
              if (value == "Delete") {
                store.dispatch(DeleteFile(widget.thumb, widget.video,widget.type,widget.index));
              }else{
                await Share.file('video','  video.mp4',File(widget.video).readAsBytesSync(),'  video/mp4');
              }
            },
            elevation: 0,
            isExpanded: false,
            underline: Container());
      },
      converter: (store) => store,
    );
  }
}
