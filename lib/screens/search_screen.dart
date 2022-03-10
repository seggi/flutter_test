import 'package:flutter/material.dart';
import 'package:flutter_stest/core/medecine_model.dart';
import 'package:flutter_stest/widgets/app_body.dart';
import 'package:flutter_stest/widgets/custom_card.dart';
import 'package:flutter_stest/widgets/custome_draggable.dart';
import 'package:flutter_stest/widgets/shared/style.dart';
import 'package:flutter_stest/widgets/shared/ui_helper.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late Future<List<MedicineModel>> medicineModel;
  String searchString = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    medicineModel = fetchMedicineModel();
  }

  @override
  Widget build(BuildContext context) {
    return AppBodyWidget.body(
      context,
      screenName: "start screen",
      itemList: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () => context.go("/"),
                    icon: const Icon(Icons.arrow_back)),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [Text("")],
                  ),
                ),
              ],
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(2.0),
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.cancel),
                  border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1.0, color: customGreyColor),
                      borderRadius: BorderRadius.circular(24.0)),
                ),
                autofocus: true,
                onChanged: (value) {
                  setState(() {
                    searchString = value.toLowerCase();
                  });
                },
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
                                return snapshot.data![index].titleOne!
                                        .toLowerCase()
                                        .contains(searchString)
                                    ? CustomCard(
                                        data: snapshot.data![index],
                                        fn: () =>
                                            context.goNamed("medicine-details"),
                                      )
                                    : Container();
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
        const CustomDraggableSheet(),
      ],
    );
  }
}
