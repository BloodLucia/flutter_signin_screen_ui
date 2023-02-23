import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign_ui/widgets/custom_input_decoration.dart';

import '../widgets/rounded_icon_button.dart';

class SignScreen extends HookWidget {
  const SignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).viewPadding.top;
    final controller = useTabController(initialLength: 2);
    final currentIndex = useState(0);
    final visiblePassword = useState(true);
    void switchForm(int value) {
      currentIndex.value = value;
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: 72,
            vertical: (146 - height),
          ).r,
          reverse: true,
          physics: const BouncingScrollPhysics(),
          child: Form(
            child: Column(
              children: [
                _headerTitle(),
                SizedBox(height: 80.h),
                _imageSection(),
                SizedBox(height: 127.h),
                _tabBarSection(
                    controller: controller,
                    onTap: (value) => switchForm(value)),
                SizedBox(height: 80.h),
                [
                  _loginSection(visiblePassword),
                  _signUpSection(visiblePassword),
                ][currentIndex.value],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginSection(ValueNotifier<bool> visible) => Column(
        children: [
          TextFormField(
            cursorColor: HexColor('#F9BD15'),
            decoration: customInputDecoration().copyWith(hintText: '郵箱/手機號'),
          ),
          SizedBox(height: 70.h),
          TextFormField(
            cursorColor: HexColor('#F9BD15'),
            obscureText: visible.value,
            keyboardType: TextInputType.visiblePassword,
            decoration: customInputDecoration().copyWith(
              hintText: '密碼：',
              suffixIcon: IconButton(
                splashColor: Colors.transparent,
                onPressed: () => visible.value = !visible.value,
                icon: Icon(
                  visible.value ? Icons.visibility_off : Icons.visibility,
                  color:
                      visible.value ? HexColor('#A0A7BA') : HexColor('#F9BD15'),
                ),
              ),
            ),
          ),
          SizedBox(height: 44.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(right: 16).r,
                    width: 56.w,
                    height: 56.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10).w,
                      color: HexColor('#F9BD15'),
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 50.sp,
                    ),
                  ),
                  Text(
                    '自动登录',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: HexColor('#A0A7BA'),
                      fontSize: 40.sp,
                    ),
                  ),
                ],
              ),
              Text(
                '忘记密码？',
                style: TextStyle(color: HexColor('#A0A7BA'), fontSize: 40.sp),
              ),
            ],
          ),
          SizedBox(height: 130.h),
          RoundedIconButton(text: '登錄'),
        ],
      );

  Widget _signUpSection(ValueNotifier<bool> visible) => Column(
        children: [
          TextFormField(
            cursorColor: HexColor('#F9BD15'),
            decoration: customInputDecoration().copyWith(hintText: '郵箱/手機號'),
          ),
          SizedBox(height: 70.h),
          TextFormField(
            cursorColor: HexColor('#F9BD15'),
            obscureText: visible.value,
            keyboardType: TextInputType.visiblePassword,
            decoration: customInputDecoration().copyWith(
              hintText: '密碼：',
              suffixIcon: IconButton(
                splashColor: Colors.transparent,
                onPressed: () => visible.value = !visible.value,
                icon: Icon(
                  visible.value ? Icons.visibility_off : Icons.visibility,
                  color:
                      visible.value ? HexColor('#A0A7BA') : HexColor('#F9BD15'),
                ),
              ),
            ),
          ),
          SizedBox(height: 70.h),
          TextFormField(
            cursorColor: HexColor('#F9BD15'),
            obscureText: visible.value,
            keyboardType: TextInputType.visiblePassword,
            decoration: customInputDecoration().copyWith(
              hintText: '確認密碼：',
              suffixIcon: IconButton(
                splashColor: Colors.transparent,
                onPressed: () => visible.value = !visible.value,
                icon: Icon(
                  visible.value ? Icons.visibility_off : Icons.visibility,
                  color:
                      visible.value ? HexColor('#A0A7BA') : HexColor('#F9BD15'),
                ),
              ),
            ),
          ),
          SizedBox(height: 200.h),
          RoundedIconButton(text: '注冊'),
        ],
      );

  TabBar _tabBarSection({
    required TabController controller,
    required Function(int value) onTap,
  }) {
    return TabBar(
      onTap: onTap,
      splashFactory: NoSplash.splashFactory,
      labelPadding: const EdgeInsets.only(bottom: 24).r,
      physics: const NeverScrollableScrollPhysics(),
      indicatorColor: HexColor('#F9BD15'),
      indicatorWeight: 2,
      controller: controller,
      labelColor: HexColor('#F9BD15'),
      unselectedLabelColor: HexColor('#333333'),
      labelStyle: TextStyle(
        fontSize: 46.sp,
        fontWeight: FontWeight.w700,
      ),
      tabs: const [
        Text('登錄'),
        Text('注冊'),
      ],
    );
  }

  Container _imageSection() {
    return Container(
      padding: const EdgeInsets.only(top: 215, right: 105, left: 94).r,
      alignment: Alignment.bottomCenter,
      width: double.infinity,
      height: 851.h,
      decoration: BoxDecoration(
        color: HexColor('#F5F5F5'),
        borderRadius: BorderRadius.circular(100).w,
      ),
      child: Image.asset(
        'assets/images/Group.png',
        fit: BoxFit.cover,
      ),
    );
  }

  Text _headerTitle() {
    return Text(
      '😄歡迎回來😄',
      style: TextStyle(
        fontSize: 70.sp,
        color: HexColor('#333333'),
      ),
    );
  }
}
