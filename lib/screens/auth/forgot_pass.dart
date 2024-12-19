import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:top_star/controllers/auth_controller.dart';
import 'package:top_star/core/extension/text_theme_ext.dart';
import 'package:top_star/services/toast_service.dart';


import '../../core/app_widgets/app_button.dart';
import '../../core/app_widgets/back_button.dart';
import '../../core/app_widgets/my_text_filed.dart';
import '../../core/constants/app_color.dart';
import '../../core/constants/dimesions.dart';
import '../../services/app_validator_service.dart';

class ForgotPassPage extends GetView<AuthController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(Dimesion.radius15),
          ),
        ),
        toolbarHeight: Dimesion.screenHeight/11,
        leading: backButton(),
        backgroundColor: AppColor.primaryClr,
        centerTitle: true,
        title: Text("Forgot Password".tr,style: TextStyle(color: Colors.white,fontSize: Dimesion.font16,fontWeight: FontWeight.bold),),
      ),
      body: Container(
        padding: EdgeInsets.all(Dimesion.width20),
        child: Column(
          children: [
            Image.asset("assets/img/forgot_pass.png",height: Dimesion.screenHeight/3.9,width: Dimesion.screeWidth,),
            SizedBox(
              height: Dimesion.height15,
            ),
            Center(
              child: Text(
                "Forgot Password".tr,
                style: TextStyle(fontSize: Dimesion.font16,fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(textAlign: TextAlign.center,
                "Please enter your email address or phone number to receive verification code.".tr,
                style: TextStyle(fontSize: Dimesion.font14-3,fontWeight: FontWeight.normal),
              ),
            ),
            SizedBox(
              height: Dimesion.height15,
            ),
            MyTextFieldWidget(
              controller: controller.forgotEmailController,
              isPasswords: false,
              prefixIcon: Icons.email_outlined,
              inputType: TextInputType.text,
              hintText: "Enter your email".tr,
              inputAction: TextInputAction.next,
              fieldValidator:
              AppValidator.emailValidator(context: context), height: Dimesion.height40,
            ),
            SizedBox(
              height: Dimesion.height15,
            ),

            Flexible(child: AppButtonWidget(
                title: Text(
                  "Continue".tr,
                  style: context.bodyLarge
                      .copyWith(color: Colors.white),
                ),
                onTap: () {

                  if(controller.forgotEmailController.text.toString()!=""){
                    controller.forgotPassword(email: controller.forgotEmailController.text);
                  }else{
                    ToastService.errorToast("Please Enter Your Email");
                  }
                  /*FocusManager.instance.primaryFocus!.unfocus();
                    if (loginFormKey.currentState!.validate()) {
                      controller.login();
                    }*/
                },
                color: AppColor.primaryClr,
                minWidth: double.maxFinite)),
          ],
        ),
      ),
    );
  }
}
