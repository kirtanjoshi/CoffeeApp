import 'package:coffee_app/global/constants/app_color.dart';
import 'package:coffee_app/global/constants/app_image.dart';
import 'package:coffee_app/global/constants/buton.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({super.key});

  @override
  State<UploadImageScreen> createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.onBoardingPriColor,
        body: Container(
          margin: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(AppImage.coffeeImage),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: AppColor.primaryTextColor,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Text(
                "Upload Your Photo \n Profile",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Sora',
                  color: AppColor.secondaryColor,
                ),
              ),
              const Gap(5),
              Text(
                  "This data will displayed in your account \n profile for security",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColor.secondaryTextColor,
                  )),
              const Gap(30),
              Container(
                  width: double.infinity,
                  height: 130,
                  decoration: BoxDecoration(
                      color: AppColor.onBoardingSecColor,
                      borderRadius: BorderRadius.circular(22)),
                  child: Center(
                    child: Image.asset(AppImage.galleryIcon),
                  )),
              const Gap(10),
              Container(
                  width: double.infinity,
                  height: 130,
                  decoration: BoxDecoration(
                      color: AppColor.onBoardingSecColor,
                      borderRadius: BorderRadius.circular(22)),
                  child: Center(
                    child: Image.asset(AppImage.cameraIcon),
                  )),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CommonButton(
                    buttonColor: AppColor.primaryColor,
                    text: "Next",
                    height: 50,
                    width: 150,
                    onPress: () {
                      Navigator.of(context).pushNamed('/location');
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
