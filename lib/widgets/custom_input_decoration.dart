import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

InputDecoration customInputDecoration() {
  return InputDecoration(
    hintStyle: TextStyle(
      fontSize: 42.sp,
      color: HexColor('#333333'),
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 47, vertical: 49).r,
  );
}
