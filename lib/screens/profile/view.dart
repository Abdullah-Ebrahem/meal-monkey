import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/cache_helper.dart';
import 'package:flutter_application_1/core/methods.dart';
import 'package:flutter_application_1/screens/after_splash/view.dart';
import 'package:flutter_application_1/screens/profile/components/item_details.dart';
import 'package:flutter_application_1/screens/profile/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/proj_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: Builder(builder: (context) {
        final cubit = ProfileCubit.getObject(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text('Profile'),
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.shopping_cart))
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
                  width: MediaQuery.of(context).size.width,
                ),
                BlocBuilder<ProfileCubit, ProfileStates>(
                  builder: (context, state) => CircleAvatar(
                      backgroundImage: CacheHelper.getProfileImg().isNotEmpty
                          ? FileImage(File(CacheHelper.getProfileImg()))
                              as ImageProvider
                          : const AssetImage('assets/images/photo.png'),
                      radius: 55.r,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: IconButton(
                            onPressed: cubit.imagePick,
                            icon: Icon(
                              Icons.camera_alt_rounded,
                              color: Colors.white.withOpacity(0.44),
                            )),
                      )),
                ),
                SizedBox(
                  height: 18.h,
                ),
                GestureDetector(
                  onTap: cubit.imagePick,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.edit,
                        color: const Color(0xffFC6011),
                        size: 10.81.h,
                      ),
                      SizedBox(
                        width: 6.8.w,
                      ),
                      Text(
                        'Edit Profile',
                        style: TextStyle(
                            color: const Color(0xffFC6011), fontSize: 10.sp),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 11.h,
                ),
                Text(
                  'Hi there ${CacheHelper.getName().split(' ').first}',
                  style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff4A4B4D)),
                ),
                SizedBox(
                  height: 4.h,
                ),
                GestureDetector(
                  onTap: () {
                    CacheHelper.prefs.clear();
                    navigateTo(
                        page: const AfterSplashScreen(), withHistory: false);
                  },
                  child: Text(
                    'Sign Out',
                    style: TextStyle(
                        color: const Color(0xff7C7D7E), fontSize: 11.sp),
                  ),
                ),
                SizedBox(
                  height: 47.h,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                      cubit.models.length,
                      (index) => ItemDetails(
                            model: cubit.models[index],
                            controller: cubit.controllers[index],
                          )),
                ),
                ProjButton(
                  onPress: () {
                    cubit.saveProfile();
                  },
                  title: 'Save',
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
