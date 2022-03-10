import 'package:flutter/material.dart';

class AddToBag extends ChangeNotifier {
  final List _items = [];
  final List _totalAmountList = [];

  List get getNewItem => _items;
  double get getTotalAmount {
    // Compute total amount in the list
    var sum = _totalAmountList.isNotEmpty
        ? _totalAmountList.reduce((value, element) =>
            double.parse(value.toString()) + double.parse(element.toString()))
        : 0.0;
    return sum;
  }

  int get bagItemNumber => _totalAmountList.length;

  void addAmount(double item) {
    _totalAmountList.add(item);
    notifyListeners();
  }

  void add(Map item) {
    _items.add(item);
    notifyListeners();
  }

  void remove(Map itemData) {
    _items.removeWhere((item) => item['image'] == itemData["image"]);

    _totalAmountList.remove(itemData['price']);
    notifyListeners();
  }

  void removeFromList() {
    _items.clear();
    _totalAmountList.clear();
    notifyListeners();
  }
}
