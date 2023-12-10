import 'package:coffee_app/global/constants/app_color.dart';
import 'package:coffee_app/global/constants/app_image.dart';
import 'package:coffee_app/global/constants/buton.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: SizedBox(
              width: double.infinity,
              child: Image.asset(
                AppImage.onBoardingImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: double.infinity,
              child: Image.asset(
                AppImage.gradientImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: Get.height * 0.03,
            top: Get.height * 0.6,
            child: Column(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  "Coffee so good, \n your taste buds \n will love it ",
                  style: TextStyle(
                    color: AppColor.primaryTextColor,
                    fontSize: 34,
                    fontFamily: 'Sora',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Gap(20),
                Text(
                  "The best grain , the finest roast, the \n powerful flavor ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Sora',
                      fontSize: 14,
                      color: AppColor.secondaryTextColor),
                ),
                Gap(35),
                CommonButton(
                    buttonColor: AppColor.primaryColor,
                    text: "Get Started",
                    height: 56,
                    width: 320,
                    onPress: () {
                      Navigator.of(context).pushNamed('/login');
                    }),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
