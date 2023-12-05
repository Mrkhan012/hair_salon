import 'package:fluttertoast/fluttertoast.dart';
import 'package:hair_salon_app/utils/colors.dart';

class Util {
  static void toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: roseWood,
      textColor: white,
    );
  }
}
