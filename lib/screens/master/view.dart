import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/screens/master/components/itembottom.dart';
import 'package:flutter_application_1/screens/master/cubit.dart';
import 'package:flutter_application_1/screens/master/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MasterScreen extends StatefulWidget {
  const MasterScreen({super.key});

  @override
  State<MasterScreen> createState() => _MasterScreenState();
}

class _MasterScreenState extends State<MasterScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MasterCubit(),
      child: Builder(builder: (context) {
        final controller = MasterCubit.getObject(context);
        return WillPopScope(
          onWillPop: () async {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Are you sure you want to quit?'),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        if (Platform.isAndroid) {
                          SystemNavigator.pop();
                        } else if (Platform.isIOS) {
                          exit(0);
                        }
                      },
                      child: const Text('exit'))
                ],
              ),
            );
            return true;
          },
          child: Scaffold(
            floatingActionButton: BlocBuilder<MasterCubit, MasterStates>(
              builder: (context, state) => FloatingActionButton(
                  onPressed: () {
                    controller.currentIndex = 4;
                    controller.iSelected();
                    // setState(() {});
                  },
                  backgroundColor: controller.currentIndex == 4
                      ? const Color(0xffFC6011)
                      : const Color(0xffB6B7B7),
                  foregroundColor: Colors.white,
                  child: const Icon(
                    Icons.home,
                    size: 30,
                  )),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            body: BlocBuilder<MasterCubit, MasterStates>(
              builder: (context, state) => Padding(
                padding: const EdgeInsetsDirectional.only(bottom: 50),
                child: controller.screens[controller.currentIndex],
              ),
            ),
            bottomNavigationBar: Container(
              height: 80,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    blurRadius: 29,
                    spreadRadius: 29,
                    color: const Color(0xff4A4B4D).withOpacity(0.11))
              ]),
              child: BottomAppBar(
                shape: const CircularNotchedRectangle(),
                notchMargin: 20,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 15, end: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                        controller.icons.length,
                        (index) => BlocBuilder<MasterCubit, MasterStates>(
                              builder: (context, state) => ItemBottom(
                                  isSelected: controller.currentIndex == index,
                                  icon: controller.icons[index],
                                  title: controller.titles[index],
                                  ontap: () {
                                    controller.currentIndex = index;
                                    controller.iSelected();
                                    // setState(() {});
                                  }),
                            )),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
