import 'package:chatty_ai/Constants/custom_view_model.dart';
import 'package:flutter/material.dart';

class ProfileInfoModel extends ViewModel {
  // Final Fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // Get Final Fieds
  TextEditingController get nameController => _nameController;
  TextEditingController get genderController => _genderController;
  GlobalKey<FormState> get formKey => _formKey;
  // Non Final Fields
  ValueNotifier<bool> imageError = ValueNotifier(false);
}
