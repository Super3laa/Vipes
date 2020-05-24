import 'package:captureit/UI/screens/tabs/collectionsTab.dart';
import 'package:captureit/UI/screens/tabs/videoRecordingTab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          shape: Border(bottom: BorderSide(color: Colors.black12)),
          elevation: 0,
          flexibleSpace: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.white,
                labelPadding: EdgeInsets.only(top: 30),
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.camera, color: Colors.yellow[700]),
                        Text('Action'),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Icon(Icons.favorite, color: Colors.red),
                        Text('Vibes'),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
        body: Container(
          color: Color(int.parse('0xFF121111')),
          child: TabBarView(children: [
            VideoRecordingTab(),
            CollectionsTab(),
          ]),
        ),
      ),
    );
  }
}
