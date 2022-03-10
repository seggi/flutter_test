import 'package:flutter_stest/provider/add_bag.dart';
import 'package:provider/provider.dart';

Map<String, dynamic> data = {
  "data": [
    {
      "image": "https://media.mehrnews.com/d/2019/02/26/4/3058681.jpg",
      "titleOne": "Garlic Oil",
      "titleTwo": "Garlic Oil",
      "titleThree": "Soft Gel-650mg",
      "price": "128"
    },
    {
      "image": "https://assets.apoly.de/medikamente-de-pzns/1000/01126111.png",
      "titleOne": "Garlic Oil",
      "titleTwo": "Garlic Oil",
      "titleThree": "Soft Gel-650mg",
      "price": "12"
    }
  ]
};

class MedicineModel {
  final String medicineImage;
  final String? titleOne;
  final String? titleTwo;
  final String? titleThree;
  final String? price;

  MedicineModel(
      {this.price,
      required this.medicineImage,
      this.titleOne,
      this.titleTwo,
      this.titleThree});

  factory MedicineModel.fromJson(Map<String, dynamic> medicineData) {
    return MedicineModel(
      medicineImage: medicineData["image"],
      titleOne: medicineData["titleOne"],
      titleThree: medicineData["titleThree"],
      titleTwo: medicineData['titleTwo'],
      price: medicineData['price'],
    );
  }
}

Future<List<MedicineModel>> fetchMedicineModel() async {
  var expensesData = data["data"] as List;
  var getData =
      expensesData.map((expense) => MedicineModel.fromJson(expense)).toList();
  return getData;
}
