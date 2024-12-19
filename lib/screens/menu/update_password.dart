import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../../core/app_widgets/app_button.dart';
import '../../core/app_widgets/back_button.dart';
import '../../core/app_widgets/my_text_filed.dart';
import '../../core/constants/app_color.dart';
import '../../core/constants/dimesions.dart';
import '../../services/app_validator_service.dart';

class UpdatePasswordPage extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(Dimesion.radius10),
        decoration: BoxDecoration(
          boxShadow:[
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), //color of shadow
              spreadRadius: 5, //spread radius
              blurRadius: 7, // blur radius
              offset: Offset(0, 2), // changes position of shadow
              //first paramerter of offset is left-right
              //second parameter is top to down
            ),
            //you can set more BoxShadow() here
          ],
          color: AppColor.white,),
        child: AppButtonWidget(
          color: AppColor.primaryClr,
          title: Text(
            "Submit".tr,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.white),
          ),
          onTap: () => {
            if(controller.passwordController.text.toString()!="" && controller.confirmPasswordController.text.toString()!=""){
              controller.update_password(email: controller.forgotEmailController.text, password: controller.passwordController.text, confirm_password: controller.confirmPasswordController.text)
            }
          },
          minWidth: Dimesion.screeWidth ,
          height: Dimesion.height40 * 1.1,
        ),
      ),
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
        title: Text("Update Password".tr,style: TextStyle(color: Colors.white,fontSize: Dimesion.font16,fontWeight: FontWeight.bold),),
      ),
      body: Container(
        padding: EdgeInsets.all(Dimesion.width15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Gap(Dimesion.height10),
            Text("  "+"New Password".tr,style: TextStyle(color: Colors.black,fontSize: Dimesion.font16,fontWeight: FontWeight.normal),),
            MyTextFieldWidget(
              hideIcon: true,
              controller: controller.passwordController,
              isPasswords: true,
              prefixIcon: Icons.key,
              inputType: TextInputType.text,
              inputAction: TextInputAction.next,
              fieldValidator:
              AppValidator.passwordValidator(context: context), height: Dimesion.height40,
            ),
            Gap(Dimesion.height10),
            Text("  "+"Confirm Password".tr,style: TextStyle(color: Colors.black,fontSize: Dimesion.font16,fontWeight: FontWeight.normal),),
            MyTextFieldWidget(
              hideIcon: true,
              controller: controller.confirmPasswordController,
              isPasswords: true,
              prefixIcon: Icons.key,
              inputType: TextInputType.text,
              inputAction: TextInputAction.next,
              fieldValidator:
              AppValidator.confirmPasswordValidator(context: context, password: controller.passwordController.text), height: Dimesion.height40,
            ),
          ],
        ),
      ),
    );
  }
}
