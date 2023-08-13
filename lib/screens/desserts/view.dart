import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/search_bar.dart';
import 'package:flutter_application_1/screens/desserts/components/item_dessert.dart';
import 'package:flutter_application_1/screens/desserts/cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DessertsScreen extends StatefulWidget {
  const DessertsScreen({super.key});

  @override
  State<DessertsScreen> createState() => _DessertsScreenState();
}

class _DessertsScreenState extends State<DessertsScreen> {
  final cubit = DessertsCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leadingWidth: 30.4.w,
          leading: Padding(
            padding: EdgeInsetsDirectional.only(start: 6.w),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
              ),
            ),
          ),
          title: const Text(
            'Desserts',
          ),
          bottom: const SearchBarCustom(),
        ),
        body: ListView.builder(
          itemCount: cubit.models.length,
          itemBuilder: (context, index) => ItemDessert(
            fisrtItem: index == 0,
            model: cubit.models[index],
          ),
        ));
  }
}
