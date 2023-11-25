import 'package:coffee_app/global/constants/app_color.dart';
import 'package:coffee_app/global/constants/app_image.dart';
import 'package:coffee_app/global/constants/buton.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                    "Sign In",
                    style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Sora',
                        fontWeight: FontWeight.w600,
                        color: AppColor.primaryTextColor),
                  ),
                  const Gap(10),
                  Text(
                    "We've already met!",
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
                              prefixIcon: const Icon(Icons.email_outlined),
                              hintText: "Enter email",
                              hintStyle:
                                  TextStyle(color: AppColor.secondaryTextColor),
                              labelText: "EMAIL",
                              labelStyle:
                                  TextStyle(color: AppColor.primaryTextColor),
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0x001d1917)),
                                  borderRadius: BorderRadius.circular(12)),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.brown),
                              )),
                        ),
                      ),
                      const Gap(20),
                      SizedBox(
                        width: double.infinity,
                        child: TextFormField(
                          style: TextStyle(color: AppColor.primaryTextColor),
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.password),
                              hintText: "Enter password",
                              hintStyle:
                                  TextStyle(color: AppColor.secondaryTextColor),
                              labelText: "PASSWORD",
                              labelStyle:
                                  TextStyle(color: AppColor.primaryTextColor),
                              border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0x001d1917)),
                                  borderRadius: BorderRadius.circular(12)),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.brown),
                              )),
                        ),
                      ),
                      const Gap(20),
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
                      const Gap(20),
                      CommonButton(
                          buttonColor: AppColor.buttonColor,
                          text: "Sign In",
                          height: 50,
                          width: double.infinity,
                          onPress: () {
                            Navigator.of(context).pushNamed('/fillUp');
                          }),
                      const Gap(20),
                      Text(
                        "or Continue with",
                        style: TextStyle(
                            color: AppColor.primaryTextColor,
                            fontFamily: 'Sora',
                            fontSize: 14),
                      ),
                      const Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(AppImage.facebookImage),
                          const SizedBox(width: 50),
                          Image.asset(AppImage.googleImage),
                          const SizedBox(width: 50),
                          Image.asset(AppImage.twitterImage),
                        ],
                      ),
                    ],
                  ),
                ),
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: "Don't have an account?",
                      style: TextStyle(
                        fontFamily: "Sora",
                        fontSize: 15,
                        color: AppColor.primaryTextColor,
                      )),
                  TextSpan(
                      text: "Sign Up",
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
