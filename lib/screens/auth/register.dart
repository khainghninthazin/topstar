import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shakemywidget/flutter_shakemywidget.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:top_star/core/extension/text_theme_ext.dart';


import '../../controllers/auth_controller.dart';
import '../../core/app_widgets/app_button.dart';
import '../../core/app_widgets/app_logo_widget.dart';
import '../../core/app_widgets/my_text_filed.dart';
import '../../core/app_widgets/text_span_button.dart';
import '../../core/constants/app_color.dart';
import '../../core/constants/dimesions.dart';
import '../../router/route_helper.dart';
import '../../services/app_validator_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final shakeNameKey = GlobalKey<ShakeWidgetState>(debugLabel: "name");
  final shakePhoneKey = GlobalKey<ShakeWidgetState>(debugLabel: "phone");
  final shakeEmailKey = GlobalKey<ShakeWidgetState>(debugLabel: "email");
  final shakePassKey = GlobalKey<ShakeWidgetState>(debugLabel: "password");
  final shakeConfirmPassKey = GlobalKey<ShakeWidgetState>(debugLabel: "confirm_password");
  bool isChecked = false;
  final AuthController controller=Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(Dimesion.width20),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: Dimesion.height15,
                ),
                Center(
                  child: Text(
                    "Create Account".tr,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Center(
                  child: Text(
                    "Fill Your Information below your create account".tr,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                SizedBox(
                  height: Dimesion.height20,
                ),
                Text("  "+"Name".tr,style: TextStyle(color: Colors.black,fontSize: Dimesion.font16,fontWeight: FontWeight.normal),),
                ShakeMe(
                  key: shakeNameKey,
                  shakeCount: 3,
                  shakeOffset: 10,
                  shakeDuration: Duration(milliseconds: 500),
                  child: MyTextFieldWidget(
                    hideIcon: true,
                    controller: controller.regNameController,
                    isPasswords: false,
                    prefixIcon: CupertinoIcons.phone,
                    inputType: TextInputType.text,
                    hintText: "".tr,
                    inputAction: TextInputAction.next, height: Dimesion.height40,
                  ),
                ),
                SizedBox(
                  height: Dimesion.width5,
                ),
                Text("  "+"Phone".tr,style: TextStyle(color: Colors.black,fontSize: Dimesion.font16,fontWeight: FontWeight.normal),),
                ShakeMe(
                  key: shakePhoneKey,
                  shakeCount: 3,
                  shakeOffset: 10,
                  shakeDuration: Duration(milliseconds: 500),
                  child: MyTextFieldWidget(
                      hideIcon: true,
                      controller: controller.regPhoneController,
                      isPasswords: false,
                      prefixIcon: CupertinoIcons.phone,
                      inputType: TextInputType.phone,
                      hintText: "".tr,
                      inputAction: TextInputAction.next,height: Dimesion.height40
                  ),
                ),
                SizedBox(
                  height: Dimesion.width5,
                ),
                Text("  "+"Email".tr,style: TextStyle(color: Colors.black,fontSize: Dimesion.font16,fontWeight: FontWeight.normal),),

                ShakeMe(
                  key: shakeEmailKey,
                  shakeCount: 3,
                  shakeOffset: 10,
                  shakeDuration: Duration(milliseconds: 500),
                  child: MyTextFieldWidget(
                      hideIcon: true,
                      controller: controller.regEmailController,
                      isPasswords: false,
                      prefixIcon: CupertinoIcons.phone,
                      inputType: TextInputType.text,
                      hintText: "".tr,
                      inputAction: TextInputAction.next,height: Dimesion.height40
                  ),
                ),
                SizedBox(
                  height: Dimesion.width5,
                ),
                Text("  "+"Password".tr,style: TextStyle(color: Colors.black,fontSize: Dimesion.font16,fontWeight: FontWeight.normal),),
                ShakeMe(
                  key: shakePassKey,
                  shakeCount: 3,
                  shakeOffset: 10,
                  shakeDuration: Duration(milliseconds: 500),
                  child: MyTextFieldWidget(
                      hideIcon: true,
                      controller: controller.regPasswordController,
                      isPasswords: true,
                      prefixIcon: CupertinoIcons.phone,
                      inputType: TextInputType.text,
                      hintText: "".tr,
                      inputAction: TextInputAction.next,height: Dimesion.height40
                  ),
                ),
                SizedBox(
                  height: Dimesion.width5,
                ),
                Text("  "+"Confirm Password".tr,style: TextStyle(color: Colors.black,fontSize: Dimesion.font16,fontWeight: FontWeight.normal),),
                ShakeMe(
                  key: shakeConfirmPassKey,
                  shakeCount: 3,
                  shakeOffset: 10,
                  shakeDuration: Duration(milliseconds: 500),
                  child: MyTextFieldWidget(
                      hideIcon: true,
                      controller: controller.regConfirmPassController,
                      isPasswords: true,
                      prefixIcon: Icons.key,
                      inputType: TextInputType.text,
                      hintText: "".tr,
                      inputAction: TextInputAction.next,height: Dimesion.height40
                  ),
                ),
                SizedBox(
                  height: Dimesion.height15,
                ),
                CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  title: textSpanButton(
                      firstText: "Agree With".tr,
                      buttonText: "Term & Conditions".tr,
                      ontap: () => Get.toNamed(RouteHelper.register),
                      context: context),
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = !isChecked;

                    });
                  },
                ),
                SizedBox(
                  height: Dimesion.height15,
                ),

                AppButtonWidget(
                    title: Text(
                      "Sign Up".tr,
                      style: context.bodyLarge
                          .copyWith(color: Colors.white),
                    ),
                    onTap: () {
                      /*FocusManager.instance.primaryFocus!.unfocus();
                      if (registerformKey.currentState!.validate()) {
                      }else{
                        Get.snackbar("Input Data", "Please fill email/phone and password");
                      }*/
                      if(controller.regNameController.text==""){
                        shakeNameKey.currentState!.shake();
                        Get.snackbar("Input Data", "Please fill Name",colorText: AppColor.primaryClr);
                      }else if(controller.regPhoneController.text==""){
                        shakePhoneKey.currentState!.shake();
                        Get.snackbar("Input Data", "Please fill Phone Number",colorText: AppColor.primaryClr);
                      }else if(controller.regEmailController.text==""){
                        shakeEmailKey.currentState!.shake();
                        Get.snackbar("Input Data", "Please fill Email",colorText: AppColor.primaryClr);
                      }else if(controller.regPasswordController.text==""){
                        shakePassKey.currentState!.shake();
                        Get.snackbar("Input Data", "Please fill Password",colorText: AppColor.primaryClr);
                      }else if(controller.regConfirmPassController.text==""){
                        shakeConfirmPassKey.currentState!.shake();
                        Get.snackbar("Input Data", "Please fill Confirm Password",colorText: AppColor.primaryClr);
                      }else if(controller.regPasswordController.text.toString()!=controller.regConfirmPassController.text.toString()){
                        shakePassKey.currentState!.shake();
                        shakeConfirmPassKey.currentState!.shake();
                        Get.snackbar("Password Error", "Password are not the same",colorText: AppColor.primaryClr);
                      }else if(isChecked==false){
                        Get.snackbar("Agree With", "Term & Conditions",colorText: AppColor.primaryClr);
                      }else {
                      controller.registerUser(context);

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
                      Text("Do you have an account?".tr,style: Theme.of(context).textTheme.bodyMedium),
                      InkWell(
                        onTap: (){
                          Get.toNamed(RouteHelper.login);
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
                            "  Sign In ".tr,
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
        ),
      ),
    );
  }
}
