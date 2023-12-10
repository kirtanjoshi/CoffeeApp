import 'package:coffee_app/features/screens/view/dashboard/controller/ProductController.dart';
import 'package:coffee_app/features/screens/view/dashboard/widgets/product_list_widget.dart';
import 'package:coffee_app/global/constants/app_color.dart';
import 'package:coffee_app/global/constants/app_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  // FirebaseAuth _auth = FirebaseAuth.instance;

  final ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: Get.height / 2.8,
              decoration: const BoxDecoration(color: Colors.black87),
            ),
            SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20, top: 40),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "displayName",
                              style: TextStyle(
                                color: Color(0xFFB7B7B7),
                                fontFamily: 'Sora',
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              "l O C A T  I O N",
                              style: TextStyle(
                                fontFamily: 'Sora',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFDDDDDD),
                              ),
                            )
                          ],
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          // decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.circular(15)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(AppImage.testimonialImage)),
                        )
                      ],
                    ),
                    const Gap(20),
                    SizedBox(
                      height: 55,
                      child: TextFormField(
                        style: const TextStyle(color: Color(0xFF989898)),
                        decoration: InputDecoration(
                            hintText: "Search Coffee",
                            hintStyle:
                                TextStyle(color: AppColor.secondaryTextColor),
                            suffixIcon: const Icon(Icons.filter_list_outlined),
                            suffixIconColor: AppColor.primaryTextColor,
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            )),
                      ),
                    ),
                    const Gap(20),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        AppImage.coffeeImageBackground,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Gap(15),
                    Container(
                      child: TabBar(
                        controller: tabController,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        tabs: const [
                          Tab(text: "Capationo"),
                          Tab(text: "Capationo"),
                          Tab(text: "Capationo"),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      height: Get.height / 2,
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0),
                            child: ProductListWidget(),
                          ),
                          const Text("luve"),
                          const Text("here"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
