import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode next) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  static double averageRating(List<int> ratings) {
    var avgRating = 0;
    for (var i = 0; i < ratings.length; i++) {
      avgRating += ratings[i];
    }
    return double.parse((avgRating / ratings.length).toStringAsFixed(1));
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message, backgroundColor: Colors.amberAccent, fontSize: 40);
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
        context: context,
        flushbar: Flushbar(
          forwardAnimationCurve: Curves.decelerate,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.all(15),
          titleColor: Colors.white,
          borderRadius: BorderRadius.circular(10),
          reverseAnimationCurve: Curves.easeOut,
          flushbarPosition: FlushbarPosition.TOP,
          positionOffset: 20,
          message: message,
          icon: const Icon(
            Icons.error_outline,
            size: 30,
            color: Colors.white,
          ),
          backgroundColor: Colors.black,
          duration: const Duration(seconds: 3),
        )..show(context));
  }

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.black, content: Text(message)));
  }
}
