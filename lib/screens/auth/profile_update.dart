import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:top_star/controllers/auth_controller.dart';
import 'package:top_star/services/toast_service.dart';


import '../../core/app_widgets/app_button.dart';
import '../../core/app_widgets/back_button.dart';
import '../../core/app_widgets/my_text_filed.dart';
import '../../core/constants/app_color.dart';
import '../../core/constants/dimesions.dart';
import '../../services/app_validator_service.dart';

class UpdateProfilePage extends StatefulWidget {
  final AuthController authController;
  const UpdateProfilePage({super.key, required this.authController});

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();


  @override
  void initState() {
    nameController.text=widget.authController.userData.value.name.toString();
    phoneController.text=widget.authController.userData.value.phone.toString();
    emailController.text=widget.authController.userData.value.email.toString();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
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
        title: Text("Edit Profile".tr,style: TextStyle(color: Colors.white,fontSize: Dimesion.font16,fontWeight: FontWeight.bold),),
      ),
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
            "Update".tr,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Colors.white),
          ),
          onTap: () {
            setState(() {
              if(nameController.text.toString()!="null" && phoneController.text.toString()!="null" && emailController.text.toString()!="null"){
                widget.authController.updateProfile(phone: phoneController.text, name: nameController.text, email: emailController.text);
              }else{
                ToastService.errorToast("Please Fill All Data");
              }
            });
          },
          minWidth: Dimesion.screeWidth ,
          height: Dimesion.height40 * 1.1,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(Dimesion.width15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(Dimesion.height15),

              Align(
                alignment: Alignment.center,
                child: Container(
                  width: Dimesion.screenHeight/6.3,
                  height: Dimesion.screenHeight/6.3,
                  child: Badge(
                    backgroundColor: AppColor.primaryClr,
                    offset: Offset(-17, -30),
                    padding: EdgeInsets.all(Dimesion.radius5-9),
                    alignment: Alignment.bottomRight,
                    label: Icon(Icons.edit,color: AppColor.white,size: Dimesion.iconSize25,),
                    child: CircleAvatar(radius: Dimesion.screenHeight/6.3,backgroundColor: AppColor.white,backgroundImage: AssetImage("assets/img/d_pic.png"),),
                  ),
                ),
              ),
              Gap(Dimesion.height15),
              Text("  "+"Name".tr,style: TextStyle(color: Colors.black,fontSize: Dimesion.font16,fontWeight: FontWeight.bold),),
              Card(
                color: Colors.grey[100],
                child: MyTextFieldWidget(
                  hideIcon: true,
                  controller: nameController,
                  isPasswords: false,
                  prefixIcon: Icons.person,
                  inputType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  fieldValidator:
                  AppValidator.nameValidator(context: context), height: Dimesion.height40,
                ),
              ),
              Gap(Dimesion.height10),
              Text("  "+"Phone".tr,style: TextStyle(color: Colors.black,fontSize: Dimesion.font16,fontWeight: FontWeight.bold),),
              Card(
                color: Colors.grey[100],
                child: MyTextFieldWidget(
                  hideIcon: true,
                  controller: phoneController,
                  isPasswords: false,
                  prefixIcon: Icons.phone,
                  inputType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  fieldValidator:
                  AppValidator.nameValidator(context: context), height: Dimesion.height40,
                ),
              ),
              Gap(Dimesion.height10),
              Text("  "+"Email".tr,style: TextStyle(color: Colors.black,fontSize: Dimesion.font16,fontWeight: FontWeight.bold),),
              Card(
                color: Colors.grey[100],
                child: MyTextFieldWidget(
                  hideIcon: true,
                  controller: emailController,
                  isPasswords: false,
                  prefixIcon: Icons.email,
                  inputType: TextInputType.text,
                  inputAction: TextInputAction.next,
                  fieldValidator:
                  AppValidator.emailValidator(context: context), height: Dimesion.height40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}