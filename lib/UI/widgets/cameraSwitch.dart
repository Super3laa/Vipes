import 'package:async_redux/async_redux.dart';
import 'package:captureit/AE/getButton.dart';
import 'package:captureit/models/Actions/cameraSwitch.dart';
import 'package:captureit/models/button.dart';
import 'package:captureit/models/cameraStateRedux.dart';
import 'package:flutter/material.dart';

class CameraSwitchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: 0.0,
      left: 0.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StoreConnector<CameraState,Store>(builder: (context, store) {
            return IconButton(
            icon: Icon(Icons.switch_camera),
            color:Colors.white,
             onPressed: () {
               store.dispatch(CameraSwitch());
             });
          },
          converter: (store)=>store
          )          
        ],
      ),
    );
  }
}
