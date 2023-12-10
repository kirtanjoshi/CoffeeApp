import 'package:coffee_app/features/screens/bio_screen/controller/bio_controller.dart';
import 'package:coffee_app/global/constants/app_color.dart';
import 'package:coffee_app/global/constants/app_image.dart';
import 'package:coffee_app/global/constants/buton.dart';
import 'package:coffee_app/models/auth_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class FillUpScreen extends StatefulWidget {
  const FillUpScreen({
    super.key,
  });

  @override
  State<FillUpScreen> createState() => _FillUpScreenState();
}

class _FillUpScreenState extends State<FillUpScreen> {
  final controller = Get.put(BioController());
  final Data userModel = Data();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.onBoardingPriColor,
        body: Container(
          margin: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
          child: SingleChildScrollView(
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
                  "Fill your bio to get \n started",
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
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: TextFormField(
                    controller: controller.fullNameController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        hintText: "Enter your full name",
                        hintStyle:
                            TextStyle(color: AppColor.secondaryTextColor),
                        labelText: "Full name",
                        labelStyle: const TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.brown),
                        )),
                  ),
                ),
                const Gap(20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: TextFormField(
                    controller: controller.addressController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        hintText: "Enter your address",
                        hintStyle:
                            TextStyle(color: AppColor.secondaryTextColor),
                        labelText: "Address",
                        labelStyle: const TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.brown),
                        )),
                  ),
                ),
                const Gap(20),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller.phoneNumberController,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.person),
                        hintText: "Enter your phone number",
                        hintStyle:
                            TextStyle(color: AppColor.secondaryTextColor),
                        labelText: "Phone Number",
                        labelStyle: const TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.brown),
                        )),
                  ),
                ),
                const Gap(120),
                GetBuilder<BioController>(builder: (controller) {
                  return CommonButton(
                    buttonColor: AppColor.primaryColor,
                    text: "Next",
                    height: 50,
                    width: 150,
                    onPress: () async {
                      // Data userData = await Data(
                      //   fullName: controller.fullNameController.text,
                      //   address: controller.addressController.text,
                      //   phoneNumber:
                      //       controller.phoneNumberController.text.toString(),
                      // );
                      // try {
                      //   // Call the updateUserData method with the created Data object
                      //   await controller.updateUserData(userData, context);
                      //   Navigator.of(context).pushNamed('/upload');
                      // } catch (e) {
                      //   // Handle errors if needed
                      //   print("Error updating user data: $e");
                      // }
                      controller.updateUserData(
                          context: context, userModel: userModel);
                    },
                  );
                })

                // ElevatedButton(
                //     onPressed: () {
                //       SecureStorage().getStringValuesSF("email");
                //     },
                //     child: Text("read"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
