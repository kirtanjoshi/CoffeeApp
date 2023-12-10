import 'package:coffee_app/features/screens/view/dashboard/controller/ProductController.dart';
import 'package:coffee_app/global/Utils/formatter.dart';
import 'package:coffee_app/global/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListWidget extends StatelessWidget {
  ProductListWidget({super.key});
  final ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      } else {
        return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                crossAxisCount: 2,
                mainAxisSpacing: 30,
                mainAxisExtent: Get.height / 3.4),
            itemCount: controller.productList.value.data!.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed("/productDetails",
                      arguments: controller.productList.value.data![index]);
                },
                child: SizedBox(
                  width: 130,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          controller.productList.value.data![index].image![0],
                          width: double.infinity,
                          height: 132,
                          fit: BoxFit.cover,
                        ),
                        // child: CachedNetworkImage(
                        //   width: double.infinity,
                        //   height: 132,
                        //   fit: BoxFit.cover,
                        //   imageUrl:
                        //       "${controller.productList.value.data![index].image![0]}",
                        // ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 6, bottom: 2, left: 8),
                        child: Text(
                            controller.productList.value.data![index].title
                                .toString(),
                            style: const TextStyle(
                              fontFamily: 'Sora',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text("with Chocolate",
                            style: TextStyle(
                              fontFamily: 'Sora',
                              color: AppColor.secondaryTextColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            )),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(left: 8.0, right: 8, top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                Formatter.formatPrice(
                                    controller.productList.value.data![index].price.toString()),
                                style: const TextStyle(
                                  fontFamily: "Sora",
                                  color: Color(0xFF2F4B4E),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                )),
                            Container(
                              height: 37,
                              width: 37,
                              decoration: BoxDecoration(
                                  color: AppColor.primaryColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Center(
                                child: Icon(
                                  size: 20,
                                  Icons.add,
                                  color: Colors.white70,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            });
      }
    });
  }
}
