import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/profile/model.dart';

// ignore: must_be_immutable
class ItemDetails extends StatelessWidget {
  ProfileModel model = ProfileModel();
  final TextEditingController controller;
  ItemDetails({super.key, required this.model, required this.controller});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsetsDirectional.only(start: 21, end: 21, bottom: 17),
      padding: const EdgeInsetsDirectional.only(start: 34),
      decoration: BoxDecoration(
          color: const Color(0xffF2F2F2),
          borderRadius: BorderRadius.circular(28)),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          label: Text(
            model.title,
            style: const TextStyle(color: Color(0xffB6B7B7), fontSize: 10),
          ),
        ),
      ),
    );
  }
}
