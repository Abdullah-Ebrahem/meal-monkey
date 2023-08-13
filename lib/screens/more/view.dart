import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/methods.dart';
import 'package:flutter_application_1/screens/more/components/item_list_of_more.dart';
import 'package:flutter_application_1/screens/more/controller.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  final controller = MoreController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('More'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: ListView(
        padding: const EdgeInsetsDirectional.only(start: 21, end: 21, top: 31),
        children: List.generate(
            controller.models.length,
            (index) => ItemListOfMore(
                  model: controller.models[index],
                  isNotification: index == 2,
                  onTap: () {
                    navigateTo(page: controller.actions[index]);
                  },
                )),
      ),
    );
  }
}
