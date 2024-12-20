import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:top_star/controllers/auth_controller.dart';
import 'package:top_star/core/app_widgets/no_login_widget.dart';
import 'package:top_star/core/constants/app_color.dart';
import 'package:top_star/core/constants/dimesions.dart';
import 'package:top_star/router/route_helper.dart';
import 'package:top_star/screens/auth/profile_update.dart';
import 'package:top_star/screens/nav/menu_item.dart';

import '../../core/app_widgets/my_toggle.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _toggleValue = 0;

  final AuthController controller = Get.find<AuthController>();
  @override
  void initState() {
    //authController.loadUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (value) {
        return Obx(() => Scaffold(
              appBar: AppBar(
                backgroundColor: AppColor.primaryClr,
                automaticallyImplyLeading: false,
                centerTitle: true,
                title: Text(
                  "Account".tr,
                  style: TextStyle(
                      color: AppColor.white,
                      fontSize: Dimesion.font18,
                      fontWeight: FontWeight.bold),
                ),
                // actions: [
                //   if (controller.appToken.isNotEmpty)
                //     AppButtonWidget(
                //       onTap: () {
                //         controller.logout();
                //         //Get.toNamed(RouteHelper.login);
                //       },
                //       height: Dimesion.height30,
                //       minWidth: Dimesion.screeWidth / 5,
                //       title: Text(
                //         "logout".tr,
                //         style: TextStyle(
                //             color: AppColor.white,
                //             fontWeight: FontWeight.normal,
                //             fontSize: Dimesion.font14 - 1),
                //       ),
                //     ),
                //   Gap(Dimesion.width5)
                // ],
              ),
              backgroundColor: AppColor.bgColor,
              body: controller.appToken.isEmpty
                  ? NoLoginWidget()
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: Dimesion.height40 * 4.2,
                                decoration: BoxDecoration(
                                  color: AppColor.primaryClr,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                  ),
                                ),
                              ),
                              Positioned(
                                //top: Dimesion.height30,
                                //left: Dimesion.width30,
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(top: Dimesion.height20),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: Dimesion.height40 * 2.5,
                                          width: Dimesion.height40 * 2.5,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColor.bgColor,
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      'assets/img/profile.png'))),
                                        ),
                                        Gap(Dimesion.height10),
                                        Text(
                                          'Eddie',
                                          style: TextStyle(
                                              color: AppColor.white,
                                              fontSize: Dimesion.font12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // Gap(Dimesion.height5),
                          // InkWell(
                          //   onTap: () {
                          //     Get.toNamed(RouteHelper.profileUpdate,
                          //         arguments: UpdateProfilePage(
                          //             authController: controller));
                          //   },
                          //   child: Container(
                          //     width: Dimesion.screenHeight / 6.3,
                          //     height: Dimesion.screenHeight / 6.3,
                          //     child: Badge(
                          //       backgroundColor: AppColor.primaryClr,
                          //       offset: Offset(-17, -30),
                          //       padding: EdgeInsets.all(Dimesion.radius5 - 9),
                          //       alignment: Alignment.bottomRight,
                          //       label: Icon(
                          //         Icons.edit,
                          //         color: AppColor.white,
                          //         size: Dimesion.iconSize25,
                          //       ),
                          //       child: CircleAvatar(
                          //         radius: Dimesion.screenHeight / 6.3,
                          //         backgroundColor: AppColor.white,
                          //         backgroundImage:
                          //             AssetImage("assets/img/d_pic.png"),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // Text(
                          //   controller.userData.value.name.toString() != "null"
                          //       ? controller.userData.value.name.toString()
                          //       : "",
                          //   style: GoogleFonts.outfit(
                          //     textStyle: TextStyle(
                          //         color: AppColor.black,
                          //         fontSize: Dimesion.font18,
                          //         fontWeight: FontWeight.normal),
                          //   ),
                          // ),
                          // Text(
                          //     controller.userData.value.phone.toString() !=
                          //             "null"
                          //         ? controller.userData.value.phone.toString()
                          //         : "",
                          //     style: GoogleFonts.outfit(
                          //         textStyle: TextStyle(
                          //             color: AppColor.primaryClr,
                          //             fontSize: Dimesion.font14,
                          //             fontWeight: FontWeight.normal))),
                          Gap(Dimesion.height20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '     ' + 'Account Setting'.tr,
                                style: TextStyle(
                                    color: AppColor.black,
                                    fontSize: Dimesion.font16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Gap(Dimesion.height10),
                          menuListTitle(
                              text: "profile".tr,
                              imgAsset: 'assets/icon/profile.png',
                              onPressed: () {
                                Get.toNamed(RouteHelper.profileUpdate,
                                    arguments: UpdateProfilePage(
                                        authController: controller));
                              }),
                          Divider(
                            color: Colors.grey[300],
                            height: 1,
                            thickness: 1,
                            indent: Dimesion.height10 + 10,
                            endIndent: Dimesion.height10 + 10,
                          ),
                          menuListTitle(
                              text: "order_history".tr,
                              //subText: "Show your order history",
                              imgAsset: "assets/icon/order_history.png",
                              onPressed: () {
                                Get.toNamed(RouteHelper.orderhistory);
                              }),
                          Divider(
                            color: Colors.grey[300],
                            height: 1,
                            thickness: 1,
                            indent: Dimesion.height10 + 10,
                            endIndent: Dimesion.height10 + 10,
                          ),
                          menuListTitle(
                              text: "wishlist".tr,
                              //subText: "Show your wish list",
                              imgAsset: "assets/icon/heart.png",
                              onPressed: () {
                                Get.toNamed(RouteHelper.fav);
                              }),
                          Divider(
                            color: Colors.grey[300],
                            height: 1,
                            thickness: 1,
                            indent: Dimesion.height10 + 10,
                            endIndent: Dimesion.height10 + 10,
                          ),
                          // menuListTitle(
                          //     text: "change_password".tr,
                          //     //subText: "Change your password",
                          //     imgAsset: "assets/img/lock.png",
                          //     onPressed: () {
                          //       Get.toNamed(RouteHelper.changePass);
                          //     }),
                          menuListTitle(
                              text: "contact_us".tr,
                              //subText: "Our customer service",
                              imgAsset: "assets/icon/contact_us.png",
                              onPressed: () {Get.toNamed(RouteHelper.contactUs);}),
                          Divider(
                            color: Colors.grey[300],
                            height: 1,
                            thickness: 1,
                            indent: Dimesion.height10 + 10,
                            endIndent: Dimesion.height10 + 10,
                          ),
                          menuListTitle(
                              text: "privacy_policy".tr,
                              //subText: "Terms and Conditions",
                              imgAsset: "assets/icon/privacy_policy.png",
                              onPressed: () {
                                Get.toNamed(RouteHelper.privacyPolicy);
                              }),
                          Divider(
                            color: Colors.grey[300],
                            height: 1,
                            thickness: 1,
                            indent: Dimesion.height10 + 10,
                            endIndent: Dimesion.height10 + 10,
                          ),
                          menuListTitle(
                              text: 'Delete Account'.tr,
                              imgAsset: 'assets/icon/delete_acc.png',
                              onPressed: () {}),
                          Divider(
                            color: Colors.grey[300],
                            height: 1,
                            thickness: 1,
                            indent: Dimesion.height10 + 10,
                            endIndent: Dimesion.height10 + 10,
                          ),
                          Gap(Dimesion.height20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '     ' + 'App Setting'.tr,
                                style: TextStyle(
                                  color: AppColor.black,
                                  fontSize: Dimesion.font16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              //Gap(Dimesion.height10),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    '     ' + 'Enable Notification',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right: Dimesion.height10 + 10),
                                    child: Switch(
                                      value: true,
                                      onChanged: (value) {},
                                      activeColor: AppColor.white,
                                      activeTrackColor: AppColor.primaryClr,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Row(
                                    children: [
                                      Text(
                                        '     ' + 'Language',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        'English',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right: Dimesion.height10 + 10),
                                    child: Switch(
                                      value: false,
                                      onChanged: (value) {},
                                      activeColor: AppColor.white,
                                      activeTrackColor: AppColor.primaryClr
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              //Gap(Dimesion.height10),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: Dimesion.height10 + 10),
                                child: Row(
                                  children: [
                                    Container(
                                      height: Dimesion.height20 * 2,
                                      padding: EdgeInsets.only(
                                          right: Dimesion.height10 + 2),
                                      child: Image.asset(
                                        'assets/icon/logout.png',
                                        width: Dimesion.iconSize25,
                                        height: Dimesion.iconSize25,
                                        color: AppColor.red,
                                      ),
                                    ),
                                    //Gap(Dimesion.width10),
                                    GestureDetector(
                                      onTap: () {
                                        controller.logout();
                                      },
                                      child: const Text(
                                        'Sign Out',
                                        style: TextStyle(
                                          color: AppColor.red,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          // Card(
                          //   elevation: 1,
                          //   child: Container(
                          //     decoration: BoxDecoration(color: AppColor.white),
                          //     child: Row(
                          //       children: [
                          //         Flexible(
                          //             child: ListTile(
                          //           leading: Container(
                          //             height: Dimesion.height20 * 2,
                          //             padding: EdgeInsets.only(
                          //                 right: Dimesion.height10 + 2),
                          //             child: Image.asset(
                          //               "assets/img/global.png",
                          //               width: Dimesion.iconSize25,
                          //               height: Dimesion.iconSize25,
                          //               color: AppColor.primaryClr,
                          //             ),
                          //           ),
                          //           title: Text(
                          //             "language".tr,
                          //             style: TextStyle(
                          //                 color: AppColor.black,
                          //                 fontSize: Dimesion.font16,
                          //                 fontWeight: FontWeight.normal),
                          //           ),
                          //         )),
                          //         CupertinoSlidingSegmentedControl(
                          //           groupValue: controller.slideTab.value,
                          //           thumbColor: AppColor.white,
                          //           backgroundColor: AppColor.primaryClr,
                          //           children: {
                          //             0: Text(
                          //               'ENG',
                          //               style: TextStyle(
                          //                   color:
                          //                       controller.slideTab.value == 0
                          //                           ? AppColor.black
                          //                           : AppColor.white),
                          //             ),
                          //             1: Text(
                          //               'MYN',
                          //               style: TextStyle(
                          //                   color:
                          //                       controller.slideTab.value == 1
                          //                           ? AppColor.black
                          //                           : AppColor.white),
                          //             ),
                          //           },
                          //           onValueChanged: controller.onChangeSlide,
                          //         ),
                          //         Gap(Dimesion.width15)
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          // Gap(Dimesion.height10),
                          // Align(
                          //   alignment: AlignmentDirectional.centerEnd,
                          //   child: Text("Delete Account" + "   ",
                          //       style: TextStyle(
                          //           color: AppColor.primaryClr,
                          //           fontSize: Dimesion.font16,
                          //           fontWeight: FontWeight.bold)),
                          // ),
                          Gap(Dimesion.height20),
                        ],
                      ),
                    ),
            ));
      },
    );
  }
}
