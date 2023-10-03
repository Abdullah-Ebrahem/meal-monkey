import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home/components/item_bottom.dart';
import 'package:flutter_application_1/screens/home/components/item_most_popular.dart';
import 'package:flutter_application_1/screens/home/components/item_recent.dart';
import 'package:flutter_application_1/screens/home/components/item_restaurents.dart';
import 'package:flutter_application_1/screens/home/components/item_title.dart';
import 'package:flutter_application_1/screens/home/controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final cubit = HomeCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Builder(builder: (context) {
        final cubit = HomeCubit.getObject(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.shopping_cart,
                  ))
            ],
            backgroundColor: Colors.white,
            elevation: 0,
            title: const Text(
              'Good morning Akila!',
            ),
            bottom: const ItemBottom(),
          ),
          body: ListView(
            padding: EdgeInsetsDirectional.only(top: 30.h),
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      cubit.imgUrl.length,
                      (index) => Padding(
                            padding: EdgeInsetsDirectional.only(start: 21.w),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  cubit.imgUrl[index],
                                  height: 88.h,
                                  width: 88.h,
                                  fit: BoxFit.fill,
                                ),
                                SizedBox(
                                  height: 7.h,
                                ),
                                Text(
                                  cubit.titles[index],
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.bold,
                                      color: const Color(0xff4A4B4D)),
                                )
                              ],
                            ),
                          )),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              ItemTitle(title: 'Popular Restaurents', children: [
                ItemRestaurent(model: cubit.models[2], isLast: false)
              ]),
              Column(
                children: List.generate(
                    2,
                    (index) => ItemRestaurent(
                        model: cubit.models[index],
                        isLast: index == cubit.models.length - 2)),
              ),
              SizedBox(
                height: 22.8.h,
              ),
              const ItemTitle(title: 'Most Popular', children: []),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: List.generate(
                        cubit.mostPopularModels.length,
                        (index) => ItemMostPopular(
                              model: cubit.mostPopularModels[index],
                            ))),
              ),
              SizedBox(
                height: 37.h,
              ),
              ItemTitle(title: 'Recent Items', children: [
                ItemRecent(
                    imgUrl: 'assets/images/pizza.png',
                    title: 'Mulberry Pizza by Josh',
                    subTitle: ' Western Food'),
              ]),
              ItemRecent(
                  imgUrl: 'assets/images/cafe.png',
                  title: 'Barita',
                  subTitle: 'Coffee'),
              ItemRecent(
                  imgUrl: 'assets/images/masimo.png',
                  title: 'Pizza Rush Hour',
                  subTitle: 'Italian Food')
            ],
          ),
        );
      }),
    );
  }
}
