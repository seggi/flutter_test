import 'package:flutter/material.dart';
import 'package:flutter_stest/provider/add_bag.dart';
import 'package:flutter_stest/widgets/customListItem.dart';
import 'package:flutter_stest/widgets/shared/style.dart';
import 'package:flutter_stest/widgets/shared/ui_helper.dart';
import 'package:provider/provider.dart';

class CustomDraggableSheet extends StatelessWidget {
  const CustomDraggableSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var itemNumber = Provider.of<AddToBag>(context).bagItemNumber;
    return SizedBox.expand(
        child: DraggableScrollableSheet(
            initialChildSize: 0.1,
            minChildSize: 0.1,
            expand: true,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                margin: const EdgeInsets.only(
                  top: 0.0,
                ),
                decoration: BoxDecoration(
                    color: customDROPurple,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ]),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          height: 5,
                          width: 40,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                Icon(
                                  Icons.shopping_bag_outlined,
                                  size: 28,
                                  color: Colors.white,
                                ),
                                Text(
                                  "Bag",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: Center(
                                  child: Text(
                                "$itemNumber",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                ),
                              )),
                            )
                          ],
                        ),
                      ),
                      verticalSpaceMedium,
                      CustomListItem()
                    ],
                  ),
                ),
              );
            }));
  }
}
