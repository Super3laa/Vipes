import 'package:animated_floatactionbuttons/animated_floatactionbuttons.dart';
import 'package:async_redux/async_redux.dart';
import 'package:captureit/UI/VipesButtons/mergeButton.dart';
import 'package:captureit/UI/secondaryScreens/startRecording.dart';
import 'package:captureit/UI/widgets/cardVideo.dart';
import 'package:captureit/UI/widgets/cardVideoSelector.dart';
import 'package:captureit/models/Actions/getStoryInfo.dart';
import 'package:captureit/models/button.dart';
import 'package:captureit/models/cameraStateRedux.dart';
import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

class CollectionsTab extends StatefulWidget {
  @override
  _CollectionsTabState createState() => _CollectionsTabState();
}

class _CollectionsTabState extends State<CollectionsTab> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<CameraState, CameraState>(
      builder: (context, state) {
        if (state.paths.buttonMode.state=='done') {
          return Container(
            color: Colors.black,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children :[
                Loading(
                  indicator: BallPulseIndicator(),
                  size: 100.0,
                  color: Colors.red[600]),
                 Text('This Might take a while',
              style: TextStyle(color: Colors.grey[400], fontSize: 20),
              textAlign: TextAlign.center),
                  ]),
            ),
          );
        } else {
          if (state.paths.story.thumbsPath.length <= 0) {
            return StartRecording();
          } else {
            return Stack(
              children: [
                GridView.builder(
                  itemCount: state.paths.story.thumbsPath.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 9 / 16),
                  itemBuilder: (BuildContext context, int index) {
                    if (!state.paths.selected) {
                      return CardVideo(index, state.paths.story.thumbsPath,
                          state.paths.videosPath, 'story');
                    } else {
                      return CardVideoSelectionMode(index, state.paths);
                    }
                  },
                ),

                Positioned(
                  bottom: 30,
                  right: 20,
                  child: AnimatedFloatingActionButton(
                    fabButtons: <Widget>[
                      MergeButton(Button('info', Colors.red, Icons.info, '')),
                      MergeButton(Button(
                          'Collections', Colors.red, Icons.collections, '')),
                      MergeButton(state.paths.buttonMode),
                    ],
                    colorStartAnimation: Colors.red,
                    colorEndAnimation: Colors.yellow[600],
                    animatedIconData: AnimatedIcons.menu_home,
                  ),
                ),
                //MergeButton(state.paths.buttonMode),
              ],
            );
          }
        }
      },
      converter: (store) => store.state,
      onInit: (store) => store.dispatch(GetStoryInfo()),
    );
  }
}
