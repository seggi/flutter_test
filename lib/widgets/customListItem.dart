import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_stest/core/medecine_model.dart';

import 'package:flutter_stest/provider/add_bag.dart';
import 'package:flutter_stest/widgets/shared/ui_helper.dart';
import 'package:provider/provider.dart';

class CustomListItem extends StatelessWidget {
  const CustomListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var newItems = Provider.of<AddToBag>(context).getNewItem;
    var totalAmount = Provider.of<AddToBag>(context).getTotalAmount;
    var removeItem = Provider.of<AddToBag>(context);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: const Text(
            "Tap on an item for add, remove, delete, options",
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
        ),
        verticalSpaceMedium,
        SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: newItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return Slidable(
                      key: UniqueKey(),
                      startActionPane: ActionPane(
                        motion: const ScrollMotion(),
                        dismissible: DismissiblePane(
                            key: UniqueKey(),
                            onDismissed: () {
                              removeItem.remove({
                                "image": newItems[index]['image'],
                                "price": newItems[index]['price']
                              });
                            }),
                        children: const [
                          SlidableAction(
                            onPressed: doNothings,
                            backgroundColor: Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Remove',
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(newItems[index]['image']),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    horizontalSpaceRegular,
                                    Text(
                                      "${newItems[index]["number"]} X",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                    horizontalSpaceRegular,
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text("Vitamin E400",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white)),
                                        ),
                                        verticalSpaceSmall,
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text("Capsule",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white)),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                horizontalSpaceLarge,
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: Text("₦ ${newItems[index]["price"]}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white))),
                              ],
                            )
                          ],
                        ),
                      ));
                })),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              Text(
                totalAmount.toString(),
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ],
          ),
        ),
        verticalSpaceMedium,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45.0),
          child: InkWell(
            onTap: () => {},
            child: Container(
              width: 300,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Checkout",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

doNothings(BuildContext context) {}
