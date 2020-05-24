import 'package:thumbnails/thumbnails.dart';

generateThumb(String videoPath,String thumbPath) async {
  await Thumbnails.getThumbnail(
    videoFile: videoPath,
    thumbnailFolder: thumbPath,
    imageType: ThumbFormat.PNG,
    quality: 40,
  );
}