import 'package:coffee_app/data/secure%20storage/secure_storage.dart';
import 'package:coffee_app/features/screens/view/profile/view/edit_screen.dart';
import 'package:coffee_app/global/constants/app_color.dart';
import 'package:coffee_app/global/constants/app_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // final storage = Get.put(SecureStorage());

  @override
  Widget build(BuildContext context) {
    // double appBarHeight = AppBar().preferredSize.height;
    double downContainerheight = Get.height / 2.5;
    // double upContainerHeight = Get.height - appBarHeight - downContainerheight;

    return Scaffold(
        backgroundColor: const Color(0xFFECEDF5),
        appBar: AppBar(
          backgroundColor: const Color(0xFFECEDF5),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.logout_outlined),
              onPressed: () {
                SecureStorage().delete("email");
                // storage.deleteSecure("email");
                // Navigator.of(context).pushNamed("/logout");
              },
            ),
          ],
          title: const Center(
              child: Text(
            "Profile",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          )),
        ),
        body: Container(
          color: const Color(0xFFECEDF5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 15,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        AppImage.testimonialImage,
                        width: 147,
                        height: 147,
                      ),
                    ),
                    const Gap(25),
                    const Text(
                      "Sudi Mero Budi ",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 27,
                          fontFamily: 'Sora'),
                    ),
                    const Gap(0),
                    Text(
                      "sudimerobudi@gmail.com",
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Sora',
                          fontWeight: FontWeight.w400,
                          color: AppColor.secondaryTextColor),
                    ),
                    const Gap(15),
                    Center(
                      child: SizedBox(
                        height: 35,
                        width: 147,
                        child: ElevatedButton(
                            child: Center(
                              child: Text("Edit Profile"),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditScreen()));
                            }),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                height: downContainerheight,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, top: 30, bottom: 10),
                          decoration: BoxDecoration(
                              color: const Color(0xFFECEDF5),
                              borderRadius: BorderRadius.circular(5)),
                          height: 45,
                          width: 45,
                          child: const Icon(Icons.settings),
                        ),
                        const Text(
                          "Verification",
                          style: TextStyle(fontFamily: "Sora"),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, top: 20, bottom: 10),
                          decoration: BoxDecoration(
                              color: const Color(0xFFECEDF5),
                              borderRadius: BorderRadius.circular(5)),
                          height: 45,
                          width: 45,
                          child: const Icon(Icons.password),
                        ),
                        const Text(
                          "Changed Password",
                          style: TextStyle(fontFamily: "Sora"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
