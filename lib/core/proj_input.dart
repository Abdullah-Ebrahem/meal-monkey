import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ProjInput extends StatefulWidget {
  final String? hintText, label;
  final double? bottomPadding;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isLastInput, isPassword;
  bool hidden;
  final TextInputType? keyBoardType;
  ProjInput(
      {super.key,
      this.hintText,
      this.bottomPadding,
      this.controller,
      this.label,
      this.validator,
      this.isLastInput = false,
      this.keyBoardType,
      this.isPassword = false,
      this.hidden = false});

  @override
  State<ProjInput> createState() => _ProjInputState();
}

class _ProjInputState extends State<ProjInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          bottom: widget.bottomPadding ?? 28.h, start: 21.w, end: 21.w),
      child: TextFormField(
        keyboardType: widget.keyBoardType,
        obscureText: widget.isPassword && widget.hidden,
        textInputAction:
            widget.isLastInput ? TextInputAction.done : TextInputAction.next,
        validator: widget.validator,
        controller: widget.controller,
        decoration: InputDecoration(
          suffixIcon: widget.isPassword
              ? GestureDetector(
                  onTap: () {
                    widget.hidden = !widget.hidden;
                    setState(() {});
                  },
                  child: widget.hidden
                      ? const Icon(Icons.remove_red_eye)
                      : const Icon(Icons.remove_red_eye_outlined),
                )
              : const SizedBox.shrink(),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28),
              borderSide: BorderSide.none),
          contentPadding:
              EdgeInsetsDirectional.only(start: 34.w, top: 18.h, bottom: 19.h),
          hintText: widget.hintText,
          labelText: widget.label,
          filled: true,
          fillColor: const Color(0xffF2F2F2),
          hintStyle: TextStyle(color: const Color(0xffB6B7B7), fontSize: 14.sp),
        ),
      ),
    );
  }
}
