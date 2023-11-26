import 'package:coffee_app/features/screens/auth/controller/auth_contoller.dart';
import 'package:coffee_app/global/Utils/utils.dart';
import 'package:coffee_app/global/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputPasswordWidget extends StatelessWidget {
  const InputPasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        controller: controller.passwordController,
        focusNode: controller.passwordFocusNode.value,
        validator: (value) {
          if (value!.isEmpty) {
            Utils.toastMessage("Enter password");
          }
        },
        style: TextStyle(color: AppColor.primaryTextColor),
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.password),
            hintText: "Enter password",
            hintStyle: TextStyle(color: AppColor.secondaryTextColor),
            labelText: "PASSWORD",
            labelStyle: TextStyle(color: AppColor.primaryTextColor),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0x001d1917)),
                borderRadius: BorderRadius.circular(12)),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.brown),
            )),
      ),
    );
  }
}
