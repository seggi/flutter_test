import 'package:flutter/material.dart';
import 'package:flutter_stest/core/medecine_model.dart';

import 'package:flutter_stest/widgets/app_body.dart';
import 'package:flutter_stest/widgets/custom_card.dart';
import 'package:flutter_stest/widgets/custome_draggable.dart';
import 'package:flutter_stest/widgets/shared/ui_helper.dart';
import 'package:go_router/go_router.dart';

class MedicineScreen extends StatefulWidget {
  const MedicineScreen({Key? key}) : super(key: key);

  @override
  State<MedicineScreen> createState() => _MedicineScreenState();
}

class _MedicineScreenState extends State<MedicineScreen> {
  late Future<List<MedicineModel>> medicineModel;
  final Map itemDataNumber = data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    medicineModel = fetchMedicineModel();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return AppBodyWidget.body(
      context,
      screenName: "start screen",
      itemList: [
        Column(
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("${itemDataNumber['data'].length} items")],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black12),
                    child: IconButton(
                      icon: const Icon(Icons.change_circle_rounded),
                      onPressed: () {},
                    ),
                  ),
                  horizontalSpaceMedium,
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black12),
                    child: IconButton(
                      icon: const Icon(Icons.filter_alt_sharp),
                      onPressed: () {},
                    ),
                  ),
                  horizontalSpaceMedium,
                  Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.black12),
                    child: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () => context.goNamed("search"),
                    ),
                  )
                ],
              ),
            ),
            verticalSpaceRegular,
            Expanded(
              child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: FutureBuilder(
                        future: medicineModel,
                        builder: (context,
                            AsyncSnapshot<List<MedicineModel>> snapshot) {
                          if (snapshot.hasData) {
                            return GridView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 256,
                              ),
                              itemBuilder: (BuildContext context, int index) {
                                return CustomCard(
                                  data: snapshot.data![index],
                                  fn: () => context.goNamed("medicine-details",
                                      extra: snapshot.data![index]),
                                );
                              },
                            );
                          } else if (snapshot.hasError) {
                            return const Center(
                                child: Text('Something went wrong :('));
                          }
                          return const Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2.0,
                            ),
                          );
                        }),
                  )),
            ),
          ],
        ),
        CustomDraggableSheet(),
      ],
    );
  }
}
