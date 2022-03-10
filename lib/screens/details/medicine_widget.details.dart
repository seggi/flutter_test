import 'package:flutter/material.dart';
import 'package:flutter_stest/widgets/shared/style.dart';
import 'package:flutter_stest/widgets/shared/ui_helper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget staticWidgetBox() {
  return Column(
    children: [
      verticalSpaceLarge,
      const Align(
        alignment: Alignment.bottomLeft,
        child: Text("PRODUCT DETAILS",
            style: TextStyle(
              color: customGreyColor,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            )),
      ),
      verticalSpaceRegular,
      Row(
        children: [
          Row(
            children: [
              const FaIcon(
                FontAwesomeIcons.capsules,
                color: customDROPurple,
              ),
              horizontalSpaceTiny,
              horizontalSpaceTiny,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("PACK SIZE",
                      style: TextStyle(
                        color: customGreyColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      )),
                  Text("3x10",
                      style: TextStyle(
                        color: customDROTurquoise,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      )),
                ],
              )
            ],
          ),
          horizontalSpaceLarge,
          Row(
            children: [
              const Icon(
                Icons.fit_screen_sharp,
                color: customDROPurple,
              ),
              horizontalSpaceTiny,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("PRODUCT ID",
                      style: TextStyle(
                        color: customGreyColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      )),
                  Text("PRODYSXFFF",
                      style: TextStyle(
                        color: customDROTurquoise,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      )),
                ],
              )
            ],
          ),
        ],
      ),
      verticalSpaceRegular,
      Row(
        children: [
          const FaIcon(
            FontAwesomeIcons.pills,
            color: customDROPurple,
          ),
          horizontalSpaceTiny,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("CONSTITUENTS",
                  style: TextStyle(
                    color: customGreyColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  )),
              Text("Garlic Oil",
                  style: TextStyle(
                    color: customDROTurquoise,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  )),
            ],
          )
        ],
      ),
      verticalSpaceRegular,
      Row(
        children: [
          const FaIcon(
            FontAwesomeIcons.prescriptionBottle,
            color: customDROPurple,
          ),
          horizontalSpaceTiny,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("DISPEND IN",
                  style: TextStyle(
                    color: customGreyColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  )),
              Text("PACKS",
                  style: TextStyle(
                    color: customDROTurquoise,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  )),
            ],
          )
        ],
      ),
      verticalSpaceRegular,
      const Text("1 pack of Garlic Oil container 3",
          style: TextStyle(
            color: customGreyColor,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          )),
      verticalSpaceMassive,
      const SizedBox(
        height: 40.0,
      )
    ],
  );
}
