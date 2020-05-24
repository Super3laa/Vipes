import 'package:captureit/models/button.dart';
import 'package:captureit/models/film.dart';
import 'package:captureit/models/story.dart';

class Paths {
  Story story;
  List<String> videosPath;
  Film film;
  bool selected;
  Button buttonMode;
  Paths(this.story,this.film,this.videosPath,this.selected,this.buttonMode);

} 