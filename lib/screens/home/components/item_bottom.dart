import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/search_bar.dart';
import 'package:flutter_application_1/screens/home/controller.dart';
import 'package:flutter_application_1/screens/home/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemBottom extends StatelessWidget implements PreferredSizeWidget {
  const ItemBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Builder(builder: (context) {
        final cubit = HomeCubit.getObject(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(start: 21.w),
              child: Text(
                'Delivering to',
                style:
                    TextStyle(fontSize: 11.sp, color: const Color(0xffB6B7B7)),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            BlocBuilder<HomeCubit, HomeStates>(
              builder: (context, state) => DropdownButton<String>(
                padding: EdgeInsetsDirectional.only(start: 21.w),
                underline: const SizedBox.shrink(),
                elevation: 0,
                value: cubit.selectedItem,
                items: List.generate(
                    cubit.items.length,
                    (index) => DropdownMenuItem(
                        value: cubit.items[index],
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(end: 40.5.w),
                          child: Text(
                            cubit.items[index],
                            style: TextStyle(
                                color: const Color(0xff7C7D7E),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ))),
                icon: const Icon(
                  Icons.keyboard_arrow_down_sharp,
                  color: Color(0xffFC6011),
                ),
                onChanged: (value) {
                  cubit.selectedItem = value;
                  cubit.locationNewState();
                },
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            const SearchBarCustom(),
          ],
        );
      }),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(160.h);
}
