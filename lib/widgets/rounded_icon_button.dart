import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedIconButton extends GestureDetector {
  RoundedIconButton({
    Key? key,
    VoidCallback? onTap,
    required String text,
  }) : super(
          key: key,
          onTap: onTap,
          child: Container(
            width: double.infinity,
            height: 150.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100).w,
              color: HexColor('#333333'),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 70).r,
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 40.sp,
                      color: HexColor('#FFFFFF'),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 132.w,
                  height: 132.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: HexColor('#F9BD15'),
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 56.sp,
                    color: HexColor('#FFFFFF'),
                  ),
                ),
              ],
            ),
          ),
        );
}
