import 'package:flutter/material.dart';
import 'package:flutter_stest/core/medecine_model.dart';
import 'package:flutter_stest/widgets/shared/style.dart';

class CustomCard extends StatelessWidget {
  final MedicineModel data;
  final fn;
  const CustomCard({Key? key, required this.data, required this.fn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: fn,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Image.network(data.medicineImage),
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "${data.titleOne}",
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text("${data.titleTwo}"),
                  ),
                  Align(
                      alignment: Alignment.bottomLeft,
                      child: Text("${data.titleThree}"))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 80,
                    padding: const EdgeInsets.all(4.0),
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      color: customGreyColor,
                    ),
                    child: Center(
                        child: Text(
                      "N ${data.price}",
                      style: const TextStyle(color: Colors.white),
                    )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
