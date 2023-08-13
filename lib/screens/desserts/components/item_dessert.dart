import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/desserts/cubit.dart';
import 'package:flutter_application_1/screens/desserts/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/methods.dart';

// ignore: must_be_immutable
class ItemDessert extends StatelessWidget {
  DessertsModel model = DessertsModel();
  final bool fisrtItem;
  ItemDessert({super.key, required this.model, required this.fisrtItem});

  double rate = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DessertsCubit(),
      child: Builder(builder: (context) {
        final cubit = DessertsCubit.geObject(context);
        return Container(
          alignment: Alignment.bottomCenter,
          height: 193,
          margin: EdgeInsets.only(bottom: 4, top: fisrtItem ? 19 : 0),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(model.imgUrl!), fit: BoxFit.fill)),
          child: Container(
            padding: const EdgeInsetsDirectional.only(start: 21, bottom: 23.8),
            alignment: AlignmentDirectional.bottomStart,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 20,
              )
            ]),
            height: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  model.title!,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: navigatorKey.currentContext!,
                          builder: (context) => AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.amber,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15))),
                                  child: const Text('done'))
                            ],
                            title: const Text('Rating'),
                            content: RatingBar.builder(
                              initialRating: 1,
                              minRating: 1,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 3.0.w),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                rate = rating;
                                cubit.newRate();
                              },
                            ),
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.star,
                        color: Color(0xffFC6011),
                        size: 16,
                      ),
                    ),
                    const SizedBox(
                      width: 4.2,
                    ),
                    BlocBuilder<DessertsCubit, DessertStates>(
                      builder: (context, state) => Text(
                        rate.toString(),
                        style: const TextStyle(
                            color: Color(0xffFC6011), fontSize: 11),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      model.subTitle!,
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const CircleAvatar(
                      radius: 2,
                      backgroundColor: Color(0xffFC6011),
                    ),
                    const Text(
                      'Desserts',
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
