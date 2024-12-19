import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_star/core/app_widgets/app_button.dart';
import 'package:top_star/core/extension/text_theme_ext.dart';

import '../../controllers/auth_controller.dart';
import '../../core/app_widgets/app_logo_widget.dart';
import '../../core/app_widgets/my_text_filed.dart';
import '../../core/app_widgets/text_span_button.dart';
import '../../core/constants/app_color.dart';
import '../../core/constants/dimesions.dart';
import '../../router/route_helper.dart';
import '../../services/app_validator_service.dart';

class LoginPage extends GetView<AuthController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
          key: controller.formKey,
          child: Container(
        padding: EdgeInsets.all(Dimesion.width20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AppLogoWidget(),

              SizedBox(
                height: Dimesion.height15,
              ),
              Center(
                child: Text(
                  "Sign In".tr,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Center(
                child: Text(
                  "Welcome Back".tr,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
              SizedBox(
                height: Dimesion.height20,
              ),
              Text("  "+"Email / Phone Number".tr,style: TextStyle(color: Colors.black,fontSize: Dimesion.font16,fontWeight: FontWeight.normal),),
              MyTextFieldWidget(
                hideIcon: true,
                controller: controller.loginEmailController,
                isPasswords: false,
                prefixIcon: CupertinoIcons.phone,
                inputType: TextInputType.text,
                hintText: "".tr,
                inputAction: TextInputAction.next, height: Dimesion.height40,
              ),
              SizedBox(
                height: Dimesion.width5,
              ),
              Text("  "+"Password".tr,style: TextStyle(color: Colors.black,fontSize: Dimesion.font16,fontWeight: FontWeight.normal),),
              MyTextFieldWidget(
                hideIcon: true,
                controller: controller.loginPasswordController,
                isPasswords: true,
                prefixIcon: Icons.key,
                inputType: TextInputType.text,
                hintText: "".tr,
                inputAction: TextInputAction.next, height: Dimesion.height40,
              ),
              SizedBox(
                height: Dimesion.height15,
              ),
              InkWell(
                onTap: (){
                  Get.toNamed(RouteHelper.forgotPass);
                },
                child: Text(
                  "Forgot Password ?".tr,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              SizedBox(
                height: Dimesion.height15,
              ),

              AppButtonWidget(
                  title: Text(
                    "Sign In".tr,
                    style: context.bodyLarge
                        .copyWith(color: Colors.white),
                  ),
                  onTap: () {
                    //Get.toNamed(RouteHelper.nav);
                    if(controller.loginEmailController.text.toString()!="" && controller.loginPasswordController.text.toString()!=""){
                      FocusManager.instance.primaryFocus!.unfocus();
                      if (controller.formKey.currentState!.validate()) {
                        controller.login();
                      }
                    }else{
                      Get.snackbar("Input Data", "Please fill email/phone and password");
                    }
                  },
                  color: AppColor.primaryClr,
                  minWidth: double.maxFinite),
              SizedBox(
                height: Dimesion.height15,
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Don't have an account? ".tr,style: Theme.of(context).textTheme.bodyMedium),
                    InkWell(
                      onTap: (){
                        Get.toNamed(RouteHelper.register);
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                          bottom: 1, // Space between underline and text
                        ),
                        decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(
                              color: AppColor.primaryClr,
                              width: 1.0, // Underline thickness
                            ))
                        ),
                        child: Text(
                          "Sign Up Here!".tr,
                          style: TextStyle(
                            color: AppColor.primaryClr,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(
                height: Dimesion.height15,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
