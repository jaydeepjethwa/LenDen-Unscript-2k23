import 'package:flutter/material.dart';
import 'package:unscript/controller/bond/bond_controller.dart';
import 'package:unscript/presentation/view/dashboard/bond/bond_card.dart';

class BondScreen extends StatelessWidget {
  final BondController controller;
  const BondScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BondCard(),
          BondCard(),
        ],
      ),
    );
  }
}
