import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
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
      backgroundColor: AppColor.bgColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Form(
              key: controller.formKey,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: Dimesion.height40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const AppLogoWidget(),
                      SizedBox(
                        height: Dimesion.height40,
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          //height: MediaQuery.of(context).size.height,
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 5,
                                offset: Offset(0, -2),
                              ),
                            ],
                          ),
                          child: SingleChildScrollView(
                            padding: EdgeInsets.all(Dimesion.width20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ' ' + "Sign in".tr,
                                  style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                        color: AppColor.pink,
                                        fontSize: Dimesion.font18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  // TextStyle(
                                  //     color: AppColor.bottomColor,
                                  //     fontSize: Dimesion.font18,
                                  //     fontWeight: FontWeight.bold)
                                  // Theme.of(context).textTheme.titleMedium,
                                ),
                                Gap(Dimesion.height5),
                                Text(' ' + "Welcome Back".tr,
                                    style: TextStyle(
                                      color: AppColor.pink,
                                      fontSize: Dimesion.font12,
                                      fontWeight: FontWeight.bold,
                                    )
                                    //Theme.of(context).textTheme.labelMedium,
                                    ),
                                SizedBox(
                                  height: Dimesion.height20,
                                ),
                                //Text("  "+"Email / Phone Number".tr,style: TextStyle(color: Colors.black,fontSize: Dimesion.font16,fontWeight: FontWeight.normal),),
                                MyTextFieldWidget(
                                  hideIcon: false,
                                  controller: controller.loginEmailController,
                                  isPasswords: false,
                                  prefixIcon: Icons.email_outlined,
                                  inputType: TextInputType.text,
                                  hintText: "Email".tr,
                                  inputAction: TextInputAction.next,
                                  height: Dimesion.height40,
                                ),
                                SizedBox(
                                  height: Dimesion.width5,
                                ),
                                //Text("  "+"Password".tr,style: TextStyle(color: Colors.black,fontSize: Dimesion.font16,fontWeight: FontWeight.normal),),
                                MyTextFieldWidget(
                                  hideIcon: false,
                                  controller:
                                      controller.loginPasswordController,
                                  isPasswords: true,
                                  prefixIcon: Icons.lock_outline,
                                  //Image.asset('assets/icon/lock-2-line.png')
                                  inputType: TextInputType.text,
                                  hintText: "Password".tr,
                                  inputAction: TextInputAction.next,
                                  height: Dimesion.height40,
                                ),
                                SizedBox(
                                  height: Dimesion.height15,
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.toNamed(RouteHelper.forgotPass);
                                  },
                                  child: Text(' ' + "Forgot Password".tr,
                                      style: TextStyle(
                                        color: AppColor.pink,
                                        fontWeight: FontWeight.bold,
                                      )
                                      //Theme.of(context).textTheme.titleSmall,
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
                                      if (controller.loginEmailController.text
                                                  .toString() !=
                                              "" &&
                                          controller
                                                  .loginPasswordController.text
                                                  .toString() !=
                                              "") {
                                        FocusManager.instance.primaryFocus!
                                            .unfocus();
                                        if (controller.formKey.currentState!
                                            .validate()) {
                                          controller.login();
                                        }
                                      } else {
                                        Get.snackbar("Input Data",
                                            "Please fill email/phone and password");
                                      }
                                    },
                                    color: AppColor.pink,
                                    minWidth: double.maxFinite),
                                //Spacer(),
                                SizedBox(
                                  height: Dimesion.height40,
                                ),
                                SizedBox(
                                  height: Dimesion.height40,
                                ),
                                SizedBox(
                                  height: Dimesion.height40,
                                ),
                                Center(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Don't have an account? ".tr,
                                          style: TextStyle(
                                              color: AppColor.pink)
                                          //Theme.of(context).textTheme.bodyMedium
                                          ),
                                      InkWell(
                                        onTap: () {
                                          Get.toNamed(RouteHelper.register);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(
                                            bottom:
                                                1, // Space between underline and text
                                          ),
                                          // decoration: BoxDecoration(
                                          //     border: Border(bottom: BorderSide(
                                          //       color: AppColor.bottomColor,
                                          //       width: 1.0, // Underline thickness
                                          //     ))
                                          // ),
                                          child: Text(
                                            "Register Now".tr,
                                            style: TextStyle(
                                                color: AppColor.pink,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),

                                // SizedBox(
                                //   height: Dimesion.height15,
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
