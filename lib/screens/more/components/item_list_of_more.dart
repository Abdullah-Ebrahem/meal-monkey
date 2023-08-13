import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/more/model.dart';

// ignore: must_be_immutable
class ItemListOfMore extends StatelessWidget {
  MoreModel? model = MoreModel();
  bool isNotification = false;
  final Function() onTap;
  ItemListOfMore(
      {super.key,
      required this.model,
      required this.isNotification,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 75,
        margin: const EdgeInsetsDirectional.only(bottom: 19),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 75,
              margin: const EdgeInsetsDirectional.only(end: 16),
              decoration: BoxDecoration(
                  color: const Color(0xffF6F6F6),
                  borderRadius: BorderRadius.circular(7)),
            ),
            Row(
              children: [
                const SizedBox(
                  width: 13,
                ),
                CircleAvatar(
                  backgroundColor: const Color(0xffD8D8D8),
                  radius: 26.5,
                  child: Icon(
                    model!.icon,
                    color: const Color(0xff4A4B4D),
                    size: 29,
                  ),
                ),
                SizedBox(
                  width: 19,
                  height: MediaQuery.of(context).size.height,
                ),
                Text(
                  model!.title ?? '',
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff4A4B4D)),
                ),
                const Spacer(),
                const CircleAvatar(
                  radius: 16.5,
                  backgroundColor: Color(0xffF6F6F6),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xff7C7D7E),
                    size: 18,
                  ),
                ),
              ],
            ),
            isNotification
                ? Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Container(
                      width: 20.29,
                      height: 20.29,
                      margin: const EdgeInsetsDirectional.only(end: 43),
                      decoration: const BoxDecoration(
                          color: Color(0xffFF1717), shape: BoxShape.circle),
                      child: const Center(
                          child: Text(
                        '15',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      )),
                    ))
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
