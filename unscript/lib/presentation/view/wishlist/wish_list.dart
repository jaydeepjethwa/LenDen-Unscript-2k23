import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unscript/constant/color.dart';
import 'package:unscript/constant/size.dart';
import 'package:unscript/constant/textstyle.dart';
import 'package:unscript/controller/waitlist/waitlist_controller.dart';
import 'package:unscript/presentation/view/wishlist/wishList_card.dart';

class WishList extends GetView<WaitlistController> {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        leading: Icon(
          Icons.arrow_back,
          color: blue,
        ),
        title: Row(
          children: [
            const Image(
              image: AssetImage("assets/logo_1.png"),
              width: 40.0,
            ),
            horizontalSpacing(5.0),
            Text(
              "Wait List",
              style: normalText.copyWith(
                color: blue,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
        elevation: 0.7,
      ),
      body: Obx(
        () => controller.list.length == 0
            ? Container(
                width: getWidth(context),
                height: getHeight(context),
                child: Center(
                  child: Text("Wait..."),
                ),
              )
            : Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: ListView.builder(
                  itemCount: controller.list.length,
                  itemBuilder: (contect, index) {
                    return WishListCard(model: controller.list[index]);
                  },
                ),
            ),
      ),
    );
  }
}
