import '../main.dart';

int getCameraId(int id){
  int length =  cameras.length - 1;
  print(id);
  if (id == length ){
    return 0;
  }else{
    return id+=1;
  }
}