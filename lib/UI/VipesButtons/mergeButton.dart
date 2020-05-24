import 'package:async_redux/async_redux.dart';
import 'package:captureit/models/Actions/toggleView.dart';
import 'package:captureit/models/button.dart';
import 'package:captureit/models/cameraStateRedux.dart';
import 'package:flutter/material.dart';

class MergeButton extends StatelessWidget {
  final Button buttonMode;
  MergeButton(this.buttonMode);
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<CameraState, Store>(
      builder: (context, store) {
        return FloatingActionButton(
          child: Icon(
            buttonMode.icon,
            color: Colors.white,
          ),
          heroTag: buttonMode.data,
          backgroundColor: buttonMode.color,
          onPressed: () {
            if (buttonMode.data == 'merge'||buttonMode.data == 'done') {
              store.dispatch(ToggleView(buttonMode.state, context));
            }else if (buttonMode.data == 'info'){
              Navigator.pushNamed(context, '/info');
            }else if (buttonMode.data == 'Collections'){
              Navigator.pushNamed(context, '/films');
            }
          },
        );
      },
      converter: (store) => store,
    );
  }
}
