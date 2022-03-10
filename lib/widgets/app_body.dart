import 'package:flutter/material.dart';

class AppBodyWidget {
  static Widget body(context,
      {String? screenName,
      String? screenTitle,
      List<Widget> itemList = const []}) {
    return screenName == "start screen"
        ? Scaffold(
            body: SafeArea(
              child: Stack(
                children: [...itemList],
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              title: Align(
                alignment: Alignment.center,
                child: Text(screenTitle!),
              ),
            ),
            body: Stack(
              children: [...itemList],
            ),
          );
  }
}
