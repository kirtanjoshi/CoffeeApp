import 'package:coffee_app/global/constants/app_color.dart';
import 'package:coffee_app/global/constants/app_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EditScreen extends StatelessWidget {
  const EditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // double appBarHeight = AppBar().preferredSize.height;
    // double upContainerHeight = Get.height - appBarHeight - downContainerheight;

    return SafeArea(
      child: Scaffold(
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
                  // Handle logout button press
                },
              ),
            ],
            title: const Center(
                child: Text(
              "Edit Profile",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            )),
          ),
          body: Container(
            margin: const EdgeInsets.all(20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        AppImage.testimonialImage,
                        width: 147,
                        height: 147,
                      ),
                    ),
                  ),
                  const Gap(25),
                  Text(
                    "Full Name",
                    style: TextStyle(
                        color: AppColor.secondaryTextColor,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Sora",
                        fontSize: 12),
                  ),
                  TextFormField(),
                  const Gap(40),
                  Text(
                    "Email Address",
                    style: TextStyle(
                        color: AppColor.secondaryTextColor,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Sora",
                        fontSize: 12),
                  ),
                  TextFormField(),
                  const Gap(40),
                  Text(
                    "Phone Number",
                    style: TextStyle(
                        color: AppColor.secondaryTextColor,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Sora",
                        fontSize: 12),
                  ),
                  TextFormField(),
                  const Gap(40),
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
          )),
    );
  }
}
