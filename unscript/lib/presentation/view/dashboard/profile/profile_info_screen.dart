import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:unscript/constant/color.dart';
import 'package:unscript/constant/constant.dart';
import 'package:unscript/constant/size.dart';
import 'package:unscript/constant/textstyle.dart';
import 'package:http/http.dart' as http;
import 'package:unscript/service/base_client.dart';

class ProfileInfoScreen extends StatefulWidget {
  const ProfileInfoScreen({super.key});

  @override
  State<ProfileInfoScreen> createState() => _ProfileInfoScreenState();
}

class _ProfileInfoScreenState extends State<ProfileInfoScreen> {
  String name = "";
  String email = "";
  String phone = "";
  String pan = "", addres = "", bank = "", photo = "";
  bool isLoading = true;
  Future getAllData() async {
    String id = storage.read("userId").toString();
    String url = "$baseUrl/user/$id";
    http.Response temp = await BaseClient().getRequest(url);
    setState(() {
      var response = json.decode(temp.body);
      name = response["name"];
      email = response["email"];
      phone = response["contact_no"];
      photo = response["profile_photo"];
      pan = response["pan_card"];
      bank = response["bank_detail"];
      addres = response["address_proof"];
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getAllData();
  }

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
              "Profile",
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
      body: !isLoading ?
      SingleChildScrollView(
        child: Container(
          height: getHeight(context) + kBottomNavigationBarHeight,
          width: getWidth(context),
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _displayCard(name, context),
              _displayCard(email, context),
              _displayCard(phone, context),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _displayImage(context, photo),
                  _displayImage(context, pan),
                ],
              ),
              verticalSpacing(40.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _displayImage(context, addres),
                  _displayImage(context, bank),
                ],
              ),
            ],
          ),
        ),
      ) : CircularProgressIndicator(),
    );
  }

  Widget _displayImage(BuildContext context, String url) {
    return url == ""
        ? Container()
        : Image.memory(
            Base64Decoder().convert(
              url,
            ),
            width: 150,
            height: 150,
          );
  }

  Widget _displayCard(String title, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      width: getWidth(context) - 40.0,
      decoration: BoxDecoration(
        color: lightGrey,
        border: Border.all(color: blue, width: 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        child: Text(
          title,
          style: header2,
        ),
      ),
    );
  }
}
