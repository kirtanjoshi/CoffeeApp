import 'package:coffee_app/features/screens/auth/controller/auth_contoller.dart';
import 'package:coffee_app/global/constants/app_color.dart';
import 'package:coffee_app/global/constants/buton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginButtonWidget extends StatefulWidget {
  final formKey;
  const LoginButtonWidget({Key? key, required this.formKey}) : super(key: key);

  @override
  State<LoginButtonWidget> createState() => _LoginButtonWidgetState();
}

class _LoginButtonWidgetState extends State<LoginButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());
    return Obx(() => CommonButton(
        loading: controller.loading.value,
        buttonColor: AppColor.buttonColor,
        text: "Sign In",
        height: 50,
        width: double.infinity,
        onPress: () {
          setState(() {
            if (widget.formKey.currentState!.validate()) {
              controller.login(context);
            }
          });
        }));
  }
}
