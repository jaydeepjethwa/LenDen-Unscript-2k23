import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:unscript/controller/bond/bond_controller.dart';
import 'package:unscript/presentation/view/dashboard/bond/bond_card.dart';

class BondScreen extends StatelessWidget {
  final BondController controller;
  const BondScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => (controller.isLoading.value == true)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: ((context, index) {
                return BondCard(
                  bond: controller.bondList[index],
                );
              }),
              itemCount: controller.bondList.length,
              shrinkWrap: true,
            ),
    );
  }
}
