import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastMessage{
  static ToastMessage instance = ToastMessage._init();
  ToastMessage._init();
  Future<void> success() {
    return Fluttertoast.showToast(
      msg: "İşlem Başarıyla Gerçekleşti!",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.green,

    );
  }
  Future<void> incorrectLogin() {
    return Fluttertoast.showToast(
      msg: "Girilen Bilgiler Eşleşmiyor!",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.red,

    );
  }
  Future<void> errorMessage({String? errorMessage}) {
    return Fluttertoast.showToast(
        msg: "$errorMessage",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.red,

    );
  }
  Future<void> standardErrorMessage() {
    return Fluttertoast.showToast(
      msg: "Bir hata meydana geldi!",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.red,

    );
  }

  Future<void> dbConnectionErrorMessage() {
    return Fluttertoast.showToast(
      msg: "Database Bağlantısı Sağlanamadı!",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.red,

    );
  }
  Future<void> wrongDepartmentErrorMessage() {
    return Fluttertoast.showToast(
      msg: "Bağlı olduğunuz departman bu işlemi gerçekleştiremez.",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.red,

    );
  }
  Future<void> alreadyProcessedMessage() {
    return Fluttertoast.showToast(
      msg: "Zaten işlem yapılmış!",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.green,

    );
  }
  Future<void> completePreviousStationsErrorMessage() {
    return Fluttertoast.showToast(
      msg: "Önceki istasyonlar tamamlamadan bu istasyonda işlem yapılamaz!",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.red,

    );
  }
}