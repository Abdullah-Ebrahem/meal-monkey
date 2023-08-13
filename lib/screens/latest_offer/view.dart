import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/latest_offer/components/item_bar.dart';
import 'package:flutter_application_1/screens/latest_offer/components/item_offers.dart';
import 'package:flutter_application_1/screens/latest_offer/cubit.dart';

class LatestOffersScreen extends StatelessWidget {
  LatestOffersScreen({super.key});
  final cubit = OffersCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          bottom: const ItemBar(),
          title: const Text('Latest Offers'),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
          ],
        ),
        body: ListView.builder(
          itemCount: cubit.models.length,
          itemBuilder: (context, index) => ItemOffer(
            model: cubit.models[index],
            isLast: index == cubit.models.length - 1,
          ),
        ));
  }
}
