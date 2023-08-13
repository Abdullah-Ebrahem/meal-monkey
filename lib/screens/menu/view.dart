import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/methods.dart';
import '../../core/search_bar.dart';
import 'components/item_menu.dart';
import 'controller.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final controller = MenuCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          bottom: const SearchBarCustom(),
          elevation: 0,
          title: const Text(
            'Menu',
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.shopping_cart,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            height: 485,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsetsDirectional.only(top: 40),
            child: Stack(children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  'assets/images/side_menu.png',
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: List.generate(
                      controller.models.length,
                      (index) => ItemMenu(
                            onTap: () {
                              navigateTo(page: controller.screens[index]);
                            },
                            model: controller.models[index],
                          )),
                ),
              )
            ]),
          ),
        ));
  }
}
