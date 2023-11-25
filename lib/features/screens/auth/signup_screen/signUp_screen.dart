import 'package:coffee_app/global/constants/app_color.dart';
import 'package:coffee_app/global/constants/app_image.dart';
import 'package:coffee_app/global/constants/buton.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height * 9,
        decoration: BoxDecoration(
            color: Color(0xFF201B18),
            image: DecorationImage(
                image: AssetImage(AppImage.background), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Container(
            height: Get.height * 0.9,
            // color: Colors.blueAccent,
            margin: EdgeInsets.only(
                left: 20, right: 20, top: Get.height * .08, bottom: 20),
            child: Column(
              // mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppImage.logo),
                Column(children: [
                  Text(
                    "Sign Up",
                    style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Sora',
                        fontWeight: FontWeight.w600,
                        color: AppColor.primaryTextColor),
                  ),
                  Gap(10),
                  Text(
                    "Let's create you an account!",
                    style: TextStyle(
                        color: AppColor.primaryTextColor,
                        fontFamily: 'Sora',
                        fontSize: 14),
                  ),
                ]),
                Form(
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          style: TextStyle(color: AppColor.primaryTextColor),
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email_outlined),
                              hintText: "Enter email",
                              hintStyle:
                                  TextStyle(color: AppColor.secondaryTextColor),
                              labelText: "EMAIL",
                              labelStyle:
                                  TextStyle(color: AppColor.primaryTextColor),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0x001d1917)),
                                  borderRadius: BorderRadius.circular(12)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.brown),
                              )),
                        ),
                      ),
                      Gap(20),
                      SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          style: TextStyle(color: AppColor.primaryTextColor),
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.password),
                              hintText: "Enter password",
                              hintStyle:
                                  TextStyle(color: AppColor.secondaryTextColor),
                              labelText: "PASSWORD",
                              labelStyle:
                                  TextStyle(color: AppColor.primaryTextColor),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0x001d1917)),
                                  borderRadius: BorderRadius.circular(12)),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.brown),
                              )),
                        ),
                      ),
                      Gap(20),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot password?",
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Sora',
                              fontWeight: FontWeight.w500,
                              color: AppColor.forgotPasswordandSignUp),
                        ),
                      ),
                      Gap(20),
                      CommonButton(
                          buttonColor: AppColor.buttonColor,
                          text: "Sign Up",
                          height: 50,
                          width: double.infinity,
                          onPress: () {}),
                      Gap(20),
                      Text(
                        "or Continue with",
                        style: TextStyle(
                            color: AppColor.primaryTextColor,
                            fontFamily: 'Sora',
                            fontSize: 14),
                      ),
                      Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(AppImage.facebookImage),
                          SizedBox(width: 50),
                          Image.asset(AppImage.googleImage),
                          SizedBox(width: 50),
                          Image.asset(AppImage.twitterImage),
                        ],
                      ),
                    ],
                  ),
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Already have an account?",
                      style: TextStyle(
                        fontFamily: "Sora",
                        fontSize: 15,
                        color: AppColor.primaryTextColor,
                      )),
                  TextSpan(
                      text: "Sign In",
                      style: TextStyle(
                          fontFamily: "Sora",
                          fontSize: 16,
                          color: AppColor.forgotPasswordandSignUp))
                ])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
