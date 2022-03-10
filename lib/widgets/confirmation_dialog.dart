import 'package:flutter/material.dart';
import 'package:flutter_stest/widgets/shared/style.dart';
import 'package:flutter_stest/widgets/shared/ui_helper.dart';

void showDialogWithFields(context) {
  showDialog(
    // barrierDismissible: false,
    context: context,
    builder: (_) {
      return Stack(children: const [
        AlertDialog(
          insetPadding: EdgeInsets.all(5.0),
          contentPadding: EdgeInsets.all(5.0),
          content: AddMedicine(),
        ),
        // Positioned(
        //   top: 180,
        //   left: 160,
        //   child: Container(
        //     padding: const EdgeInsets.all(4.0),
        //     decoration: const BoxDecoration(
        //         color: Colors.white, shape: BoxShape.circle),
        //     child: Container(
        //       height: 60,
        //       width: 60,
        //       decoration: const BoxDecoration(
        //           color: customDROTurquoise, shape: BoxShape.circle),
        //       child: const Icon(
        //         Icons.check,
        //         color: Colors.white,
        //         size: 35,
        //       ),
        //     ),
        //   ),
        // )
      ]);
    },
  );
}

class AddMedicine extends StatefulWidget {
  const AddMedicine({Key? key}) : super(key: key);

  @override
  State<AddMedicine> createState() => _AddMedicineState();
}

class _AddMedicineState extends State<AddMedicine> {
  final _formKey = GlobalKey();

  TextEditingController amountController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();
  late ScaffoldMessengerState scaffoldMessenger = ScaffoldMessenger.of(context);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        children: [
          SizedBox(
            height: 280,
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 24),
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Align(
                      alignment: Alignment.center,
                      child: Text("Successful",
                          style: TextStyle(
                              fontWeight: FontWeight.w800, fontSize: 18))),
                  verticalSpaceRegular,
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Galic Oil has been added to bug",
                          style: TextStyle(fontWeight: FontWeight.w600))),
                  verticalSpaceRegular,
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 300,
                      padding: const EdgeInsets.all(20.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: customDROTurquoise,
                          borderRadius: BorderRadius.circular(4.0)),
                      child: const Text(
                        "View Bag",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  verticalSpaceRegular,
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 300,
                      padding: const EdgeInsets.all(20.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: customDROTurquoise,
                          borderRadius: BorderRadius.circular(4.0)),
                      child: const Text(
                        "Done",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
