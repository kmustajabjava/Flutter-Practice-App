import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice_app/src/constants/colors.dart';
import 'package:practice_app/src/constants/validator.dart';
import '../../../../constants/sizes.dart';
import '../../../../constants/text_strings.dart';
import '../../controllers/login_controller.dart';
import '../forget_password/forget_password_options/forget_password_model_sheet.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: tDefaultSize - 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
                labelText: tEmail,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: tDefaultSize - 10),
            TextFormField(
              controller: controller.password,
              validator: (value) => TValidator.validatePassword(value),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.fingerprint_outlined),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove_red_eye_sharp),
                ),
                enabledBorder: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(),
                labelText: tPassword,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: tDefaultSize - 20),
            Row(
              children: [
                Obx(() => Checkbox(
                  value: controller.isRememberMeChecked.value,
                  onChanged: (newValue) {
                    controller.toggleRememberMe();
                  },
                  checkColor: tSecondaryColor,
                  activeColor: tPrimaryColor,
                ),),
                const Text(tRememberMe,),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      ForgetPasswordScreen.buildShowModalBottomSheet(context);
                    },
                    child: const Text(
                      tForgetPassword,
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  controller.login();
                },
                child: Text(tLogin.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
