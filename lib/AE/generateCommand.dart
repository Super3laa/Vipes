generateCommand(List<String> selectedVideos,String finaldir){
  String command = '';
  int  len = selectedVideos.length;
  for (int i = 0; i < len; i++) {
    command+='-i ${selectedVideos[i]} ';
  }
  command += '-filter_complex "';
  for (int i = 0; i < len; i++) {
    command+= '[$i:v:0] scale=720:1280:force_original_aspect_ratio=decrease,pad=720:1280:(ow-iw)/2:(oh-ih)/2,setsar=1[v$i]; ';
  }
  for (int i = 0; i < len; i++) {
    command+= '[v$i] [$i:a:0] ';
  }
  command += 'concat=n=$len:v=1:a=1 [v] [a]" -map "[v]" -map "[a]" -c $finaldir.mp4';
  print(command);
  return command;
}