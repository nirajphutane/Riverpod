
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart' as toast;

class Toast {
  static void show(final String message) {
    toast.Fluttertoast.showToast(
        msg: message,
        toastLength: toast.Toast.LENGTH_SHORT,
        gravity: toast.ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}