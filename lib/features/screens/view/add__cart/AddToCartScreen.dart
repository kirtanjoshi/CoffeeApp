import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:input_quantity/input_quantity.dart';

class AddToCart extends StatelessWidget {
  AddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("Product Name"),
                      subtitle: Text("Product * quantity = total"),
                      trailing: InputQty(
                        maxVal: 99,
                        initVal: 1,
                        minVal: 1,
                        onQtyChanged: (value) {},
                      ),
                    );
                  }),
            ),
            Row(
              children: [
                Flexible(
                    child: Column(
                  children: [
                    Text("5 items"),
                    Text(
                      "Total 99985",
                      style: TextStyle(
                        fontFamily: "Sora",
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                )),
                Spacer(),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: CupertinoButton(
                      padding: EdgeInsets.all(16),
                      color: Colors.amberAccent,
                      child: Text("Place Order"),
                      onPressed: () {}),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
