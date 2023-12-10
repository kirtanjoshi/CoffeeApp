import 'package:coffee_app/data/secure%20storage/secure_storage.dart';
import 'package:coffee_app/features/screens/auth/controller/auth_contoller.dart';
import 'package:coffee_app/features/screens/auth/controller/controller.dart';
import 'package:coffee_app/global/constants/app_color.dart';
import 'package:coffee_app/global/constants/buton.dart';
import 'package:coffee_app/models/auth_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginButtonWidget extends StatefulWidget {
  final formKey;
  const LoginButtonWidget({Key? key, required this.formKey}) : super(key: key);

  @override
  State<LoginButtonWidget> createState() => _LoginButtonWidgetState();
}

class _LoginButtonWidgetState extends State<LoginButtonWidget> {
  final storage = Get.put(SecureStorage());
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Controller());
    return Obx(() => CommonButton(
        loading: controller.loading.value,
        buttonColor: AppColor.buttonColor,
        text: "Sign In",
        height: 50,
        width: double.infinity,
        onPress: () {
          Data userData = Data(
              email: controller.emailController.value.text,
              password: controller.passwordController.value.text);

          setState(() {
            if (widget.formKey.currentState!.validate()) {
              controller.login(userData, context);
              // SecureStorage().writeSecureStorage(
              //     "email", controller.emailController.text.toString());
              //
              SecureStorage().addStringToSF(
                  'stringValue', controller.emailController.text);
            }
          });
        }));
  }
}
