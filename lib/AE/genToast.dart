import 'package:toast/toast.dart';

genToast(context, String msg) {
  Toast.show(msg, context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
}

genToastLong(context, String msg) {
  Toast.show(msg, context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
}

genToastMed(context, String msg) {
  Toast.show(msg, context, duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
}