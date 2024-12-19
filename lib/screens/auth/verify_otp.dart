import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:top_star/core/extension/text_theme_ext.dart';
import 'package:top_star/services/toast_service.dart';


import '../../controllers/auth_controller.dart';
import '../../core/app_widgets/app_button.dart';
import '../../core/app_widgets/back_button.dart';
import '../../core/app_widgets/my_text_filed.dart';
import '../../core/constants/app_color.dart';
import '../../core/constants/dimesions.dart';
import '../../router/route_helper.dart';
import '../../services/app_validator_service.dart';

class VerifyOtpPage extends GetView<AuthController>  {
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
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
        title: Text("Verify OTP".tr,style: TextStyle(color: Colors.white,fontSize: Dimesion.font16,fontWeight: FontWeight.bold),),
      ),
      body: Container(
        padding: EdgeInsets.all(Dimesion.width20),
        child: Column(
          children: [
            Image.asset("assets/img/otp.png",height: Dimesion.screenHeight/3.9,width: Dimesion.screeWidth,),
            SizedBox(
              height: Dimesion.height15,
            ),
            Center(
              child: Text(
                "Verification".tr,
                style: TextStyle(fontSize: Dimesion.font16,fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(textAlign: TextAlign.center,
                "We have sent verification code to - ".tr+controller.forgotEmailController.text,
                style: TextStyle(fontSize: Dimesion.font14-3,fontWeight: FontWeight.normal),
              ),
            ),
            SizedBox(
              height: Dimesion.height15,
            ),
            PinCodeTextField(
              appContext: context,
              pastedTextStyle: TextStyle(
                color: Colors.green.shade600,
                fontWeight: FontWeight.bold,
              ),
              length: 6,
              obscureText: true,
              obscuringCharacter: '*',
              obscuringWidget: const Text("*"),
              blinkWhenObscuring: true,
              animationType: AnimationType.fade,

              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.white,
              ),
              cursorColor: Colors.black,
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              errorAnimationController: errorController,
              controller: controller.otpController,
              keyboardType: TextInputType.number,
              boxShadows: const [
                BoxShadow(
                  offset: Offset(0, 1),
                  color: Colors.black12,
                  blurRadius: 10,
                )
              ],
              onCompleted: (v) {
                debugPrint("Completed");
              },
              // onTap: () {
              //   print("Pressed");
              // },
              onChanged: (value) {
                debugPrint(value);
                /*setState(() {
                  currentText = value;
                });*/
              },
              beforeTextPaste: (text) {
                debugPrint("Allowing to paste $text");
                //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                //but you can show anything you want here, like your pop up saying wrong paste format or etc
                return true;
              },
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
                  print(controller.otpController.text.length);
                  if(controller.otpController.text.toString()!="" && controller.otpController.text.length==6){
                    controller.verify_forgotPassword(email: controller.forgotEmailController.text, code: controller.otpController.text);
                  }else{
                    errorController!.add(ErrorAnimationType
                        .shake);
                    ToastService.errorToast("Enter OTP Code");
                  }

                },
                color: AppColor.primaryClr,
                minWidth: double.maxFinite)),

            const SizedBox(
              height: 20,
            ),
            Flexible(child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Didn't receive the code? ",
                  style: TextStyle(color: Colors.black54, fontSize: 15),
                ),
                TextButton(
                  onPressed: () => {
                    controller.forgotPassword(email: controller.forgotEmailController.text)
                  },
                  child: const Text(
                    "RESEND",
                    style: TextStyle(
                      color: Color(0xFF91D3B3),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            )),
          ],
        ),
      ),
    );
  }
}
