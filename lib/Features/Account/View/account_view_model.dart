import 'package:chatty_ai/Constants/custom_view_model.dart';
import 'package:flutter/material.dart';

class AccountViewModel extends ViewModel {
  // Non Final Fields
  ValueNotifier<bool> imageError = ValueNotifier(false);
  String name = "";
  String gender = "";
  DateTime dob = DateTime.now();
}
