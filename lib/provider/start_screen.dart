import 'package:flutter/material.dart';

class StartScreenData extends ChangeNotifier {
  var _userToken = '';

  String get userToken => _userToken;
  bool get startedSession => _userToken.isNotEmpty;

  void start(String userToken) {
    _userToken = userToken;
    notifyListeners();
  }
}
