import 'package:coffee_app/global/constants/app_color.dart';
import 'package:coffee_app/global/constants/app_image.dart';
import 'package:coffee_app/global/constants/buton.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
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
                "Set Your Location",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Sora',
                  color: AppColor.secondaryColor,
                ),
              ),
              const Gap(20),
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
                  height: 150,
                  decoration: BoxDecoration(
                      color: AppColor.onBoardingSecColor,
                      borderRadius: BorderRadius.circular(22)),
                  child: Container(
                    margin: const EdgeInsets.only(
                        top: 20, left: 10, right: 10, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(AppImage.locationLogo),
                            const Gap(20),
                            const Text(
                              "Your location",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Sora',
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 57,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColor.primaryColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Center(
                              child: Text("Set Location",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: CommonButton(
                    buttonColor: AppColor.primaryColor,
                    text: "Save",
                    height: 50,
                    width: 150,
                    onPress: () {},
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
