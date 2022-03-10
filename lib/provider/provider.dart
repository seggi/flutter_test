import 'package:flutter_stest/provider/add_bag.dart';
import 'package:flutter_stest/provider/navigator.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class AllProvider {
  // This is called at the root of app
  static List<SingleChildWidget> multi() {
    return [
      ListenableProvider<NavigationPath>(create: (_) => NavigationPath()),
      ChangeNotifierProvider(create: (_) => AddToBag()),
    ];
  }
}
