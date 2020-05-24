import 'package:captureit/AE/genToast.dart';
import 'package:captureit/AE/getButton.dart';
import 'package:captureit/models/Actions/cameraStart.dart';
import 'package:captureit/models/Actions/cameraSwitch.dart';
import 'package:captureit/models/Actions/refresh.dart';
import 'package:captureit/models/Actions/startRecording.dart';
import 'package:captureit/models/Actions/stopRecording.dart';
import 'package:captureit/models/Actions/timerFire.dart';
import 'package:captureit/models/button.dart';
import 'package:captureit/models/cameraStateRedux.dart';
import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';

class CameraButton extends StatefulWidget {
  @override
  _CameraButtonState createState() => _CameraButtonState();
}

class _CameraButtonState extends State<CameraButton> {
  @override
  Widget build(BuildContext context) {
    IconData _icon = Icons.videocam;
    return Positioned.fill(
      bottom: 20.0,
      left: 0.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          StoreConnector<CameraState, Store>(
              builder: (context, store) {
                return GestureDetector(
                  onTapDown: ((v){
                    genToast(context,'LongPress to Record');
                  }),
                  onLongPressStart: (v) {
                    store.dispatch(TimerFire(context));
                    setState(()=> _icon = Icons.stop);
                  },
                  onLongPressEnd: (v) {
                    store.dispatch(StopRecording(context));
                    setState(()=> _icon = Icons.videocam); 
                  },
                  child: FloatingActionButton(
                    onPressed: null,
                    backgroundColor: Colors.red[600],
                    splashColor: Colors.redAccent,
                    child:Icon(_icon,color: Colors.white),
                  ),
                );
              },
              converter: (store) => store)
        ],
      ),
    );
  }
}
