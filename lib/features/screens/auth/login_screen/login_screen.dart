import 'package:coffee_app/features/screens/auth/controller/auth_contoller.dart';
import 'package:coffee_app/features/screens/auth/controller/controller.dart';
import 'package:coffee_app/features/screens/auth/login_screen/widgets/input_email_widget.dart';
import 'package:coffee_app/features/screens/auth/login_screen/widgets/input_password_Widget.dart';
import 'package:coffee_app/features/screens/auth/login_screen/widgets/login_button_widget.dart';
import 'package:coffee_app/features/screens/auth/signup_screen/signUp_screen.dart';
import 'package:coffee_app/global/constants/app_color.dart';
import 'package:coffee_app/global/constants/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = Get.put(Controller());
  final _formKey = GlobalKey<FormState>();

  // Widget getTextField({required String hint}) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height * 9,
        decoration: BoxDecoration(
            color: const Color(0xFF201B18),
            image: DecorationImage(
                image: AssetImage(AppImage.background), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Container(
            // height: Get.height * 0.9,
            // color: Colors.blueAccent,
            margin: EdgeInsets.only(
                left: 20, right: 20, top: Get.height * .08, bottom: 20),
            child: Column(
              // mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppImage.logo),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  "Sign In",
                  style: TextStyle(
                      fontSize: 40.sp,
                      fontFamily: 'Sora',
                      fontWeight: FontWeight.w600,
                      color: AppColor.primaryTextColor),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "We've already met!",
                  style: TextStyle(
                      color: AppColor.primaryTextColor,
                      fontFamily: 'Sora',
                      fontSize: 14.sp),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const InputEmailWidget(),
                      SizedBox(
                        height: 20.h,
                      ),
                      InputPasswordWidget(),
                      SizedBox(
                        height: 20.h,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot password?",
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: 'Sora',
                              fontWeight: FontWeight.w500,
                              color: AppColor.forgotPasswordandSignUp),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      LoginButtonWidget(formKey: _formKey),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  ),
                ),
                Text(
                  "or Continue with",
                  style: TextStyle(
                      color: AppColor.primaryTextColor,
                      fontFamily: 'Sora',
                      fontSize: 14.sp),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(AppImage.facebookImage),
                    SizedBox(width: 50.w),
                    Image.asset(AppImage.googleImage),
                    SizedBox(width: 50.w),
                    Image.asset(AppImage.twitterImage),
                  ],
                ),
                SizedBox(
                  height: 25.h,
                ),
                InkWell(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (value) => const SignUpScreen()));
                  },
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Don't have an account?",
                        style: TextStyle(
                          fontFamily: "Sora",
                          fontSize: 15.sp,
                          color: AppColor.primaryTextColor,
                        )),
                    TextSpan(
                        onEnter: (value) {},
                        text: "Sign Up",
                        style: TextStyle(
                            fontFamily: "Sora",
                            fontSize: 16.sp,
                            color: AppColor.forgotPasswordandSignUp))
                  ])),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
