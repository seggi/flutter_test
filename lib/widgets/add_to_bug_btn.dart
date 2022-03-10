import 'package:flutter/material.dart';
import 'package:flutter_stest/widgets/confirmation_dialog.dart';
import 'package:flutter_stest/widgets/shared/style.dart';
import 'package:flutter_stest/widgets/shared/ui_helper.dart';

Widget addToCartBtn(context, {required fn}) {
  return Positioned(
    bottom: 30,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45.0),
      child: InkWell(
        onTap: () => fn(),
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
              color: customDROPurple, borderRadius: BorderRadius.circular(8.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.shopping_bag_outlined,
                color: Colors.white,
              ),
              horizontalSpaceSmall,
              Text(
                "Add to bug",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
