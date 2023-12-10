import 'package:coffee_app/global/constants/app_color.dart';
import 'package:coffee_app/global/constants/app_image.dart';
import 'package:coffee_app/global/constants/buton.dart';
import 'package:coffee_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Datum datum;
  const ProductDetailsScreen({
    super.key,
    required this.datum,
  });

  @override
  Widget build(BuildContext context) {
    final appBarHeight = AppBar().preferredSize.height;
    final containerHeight = Get.height - appBarHeight;
    print(Get.height);
    print(appBarHeight);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
        title: const Center(
            child: Text(
          "Detail",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        )),
      ),
      body: Container(
        width: double.infinity,
        height: containerHeight,
        margin: EdgeInsets.only(left: 20, bottom: 20, right: 20, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 8,
              child: ListView.builder(
                  itemCount: datum.image!.length,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        "${datum.image![index]}",
                        height: Get.height / 3.8,
                        fit: BoxFit.fill,
                        width: double.infinity,
                      ),
                    );
                  }),
            ),
            Spacer(),
            Container(
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(datum.title.toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Sora',
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          )),
                      Text("with Chocolate",
                          style: TextStyle(
                            color: AppColor.secondaryTextColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          )),
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Text("Quantity",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          )),
                      Gap(10),
                      Row(
                        children: [
                          ClipOval(
                            clipBehavior: Clip.antiAlias,
                            child: Container(
                              color: Color(0xFF967259),
                              width: 40.0,
                              height: 40.0,
                              child: Center(child: Icon(Icons.add)),
                            ),
                          ),
                          Gap(20),
                          Text("1"),
                          Gap(20),
                          ClipOval(
                            clipBehavior: Clip.antiAlias,
                            child: Container(
                              color: Color(0xFF967259),
                              width: 40.0,
                              height: 40.0,
                              child: Center(child: Icon(Icons.add)),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Spacer(),
            Text("Description",
                style: TextStyle(
                  fontFamily: 'Sora',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                )),
            Spacer(),
            Text(datum.description.toString(),
                style: TextStyle(
                  color: AppColor.secondaryTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                )),
            Spacer(),
            Text("Size",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                )),
            Spacer(),
            Row(
              children: [
                Container(
                  height: 47,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.pink.shade50,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text("S"),
                  ),
                ),
                Spacer(),
                Container(
                  height: 47,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.pink.shade50,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text("S"),
                  ),
                ),
                Spacer(),
                Container(
                  height: 47,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.pink.shade50,
                      borderRadius: BorderRadius.circular(15)),
                  child: Center(
                    child: Text("S"),
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Price",
                        style: TextStyle(
                          color: AppColor.secondaryTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        )),
                    Text("Price ${datum.price}",
                        style: TextStyle(
                          color: AppColor.accentColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ))
                  ],
                ),
                Spacer(),
                SizedBox(
                  height: Get.height / 15,
                  width: Get.width / 2,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.accentColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {},
                      child: Center(
                        child: Text("Buy Now",
                            style: TextStyle(
                              fontFamily: 'Sora',
                              color: AppColor.primaryTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            )),
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
