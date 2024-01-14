import 'package:flutter/material.dart';

class PasswordErrorProvider extends ChangeNotifier {
  bool _isPasswordError = false;
  String _passwordErrorText = '';

  bool get isPasswordError => _isPasswordError;
  String get passwordErrorText => _passwordErrorText;

  void setPasswordError(bool value, String errorText) {
    _isPasswordError = value;
    _passwordErrorText = errorText;
    notifyListeners();
  }
}
