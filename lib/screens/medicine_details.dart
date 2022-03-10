import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_stest/core/medecine_model.dart';
import 'package:flutter_stest/provider/add_bag.dart';
import 'package:flutter_stest/screens/details/medicine_widget.details.dart';
import 'package:flutter_stest/widgets/add_to_bug_btn.dart';
import 'package:flutter_stest/widgets/app_body.dart';
import 'package:flutter_stest/widgets/confirmation_dialog.dart';
import 'package:flutter_stest/widgets/shared/style.dart';
import 'package:flutter_stest/widgets/shared/ui_helper.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MedicineDetailsScreen extends StatefulWidget {
  final MedicineModel data;
  const MedicineDetailsScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<MedicineDetailsScreen> createState() => _MedicineDetailsScreenState();
}

class _MedicineDetailsScreenState extends State<MedicineDetailsScreen> {
  final TextEditingController _controller = TextEditingController();
  late ScaffoldMessengerState scaffoldMessenger = ScaffoldMessenger.of(context);
  @override
  void initState() {
    super.initState();
    _controller.text = "0";
  }

  Future addToBag() async {
    if (_controller.text == "0") {
      scaffoldMessenger.showSnackBar(const SnackBar(
          content: Text(
        "Nothing to save",
        style: TextStyle(color: Colors.white, fontSize: 16),
      )));
    } else {
      var amount =
          double.parse(widget.data.price!) * double.parse(_controller.text);
      Provider.of<AddToBag>(context, listen: false).addAmount(amount);
      Provider.of<AddToBag>(context, listen: false).add(
        {
          "image": widget.data.medicineImage,
          "titleOne": widget.data.titleOne,
          "titleTwo": widget.data.titleTwo,
          "price": amount,
          "number": _controller.text
        },
      );

      showDialogWithFields(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBodyWidget.body(
      context,
      screenName: "start screen",
      itemList: [
        Expanded(
            child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 60.0),
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: SizedBox(
                        height: 250,
                        child: Image.network(widget.data.medicineImage),
                      ),
                    ),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "${widget.data.titleOne}",
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                        ),
                        verticalSpaceSmall,
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "${widget.data.titleOne}",
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    verticalSpaceRegular,
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: const BoxDecoration(
                            color: customGreyColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        horizontalSpaceSmall,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("SOLD BY",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: customGreyColor)),
                            Text("Emzor Pharaceutical")
                          ],
                        )
                      ],
                    ),
                    verticalSpaceRegular,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  border: Border.all(color: customGreyColor)),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: InkWell(
                                      child: const Icon(
                                        Icons.remove,
                                        size: 18.0,
                                      ),
                                      onTap: () {
                                        int currentValue =
                                            int.parse(_controller.text);
                                        setState(() {
                                          print("Setting state");
                                          currentValue--;
                                          _controller.text = (currentValue > 0
                                                  ? currentValue
                                                  : 0)
                                              .toString(); // decrementing value
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                    child: TextField(
                                      controller: _controller,
                                      enableInteractiveSelection: false,
                                      enabled: false,
                                      decoration: const InputDecoration(
                                        contentPadding: EdgeInsets.all(2.0),
                                        hintText: '0',
                                      ),
                                      keyboardType:
                                          const TextInputType.numberWithOptions(
                                        decimal: false,
                                        signed: true,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      child: const Icon(
                                        Icons.add,
                                        size: 18.0,
                                      ),
                                      onTap: () {
                                        int currentValue =
                                            int.parse(_controller.text);
                                        setState(() {
                                          currentValue++;
                                          _controller.text = (currentValue)
                                              .toString(); // incrementing value
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            horizontalSpaceTiny,
                            const Text("Packs",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: customGreyColor))
                          ],
                        ),
                        Row(
                          children: const [
                            Text("₦",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 11,
                                    color: customGreyColor)),
                            horizontalSpaceTiny,
                            Text("385",
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18,
                                )),
                          ],
                        )
                      ],
                    ),
                    staticWidgetBox()
                  ],
                ),
              ),
              addToCartBtn(context, fn: addToBag),
              Positioned(
                top: 0,
                width: 350,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () => context.goNamed("start-screen"),
                        icon: const Icon(Icons.arrow_back)),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                color: customDROPurple,
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.card_travel,
                                  color: Colors.white,
                                ),
                                Text(
                                  "3",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ))
      ],
    );
  }
}
