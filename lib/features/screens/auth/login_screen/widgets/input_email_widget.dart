import 'package:coffee_app/features/screens/auth/controller/auth_contoller.dart';
import 'package:coffee_app/features/screens/auth/controller/controller.dart';
import 'package:coffee_app/global/Utils/utils.dart';
import 'package:coffee_app/global/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class InputEmailWidget extends StatelessWidget {
  const InputEmailWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller());
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        controller: controller.emailController,
        focusNode: controller.emailFocusNode.value,
        validator: (value) {
          if (value!.isEmpty) {
            Utils.toastMessage("Enter email");
          }
          return null;
        },
        onFieldSubmitted: (value) {
          Utils.fieldFocusChanged(context, controller.emailFocusNode.value,
              controller.passwordFocusNode.value);
        },
        style: TextStyle(color: AppColor.primaryTextColor),
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.email_outlined),
            hintText: "Enter email",
            hintStyle: TextStyle(color: AppColor.secondaryTextColor),
            labelText: "EMAIL",
            labelStyle: TextStyle(color: AppColor.primaryTextColor),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Color(0x001d1917)),
                borderRadius: BorderRadius.circular(12.r)),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.brown),
            )),
      ),
    );
  }
}
