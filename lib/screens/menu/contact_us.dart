import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_star/core/app_widgets/app_button.dart';
import 'package:top_star/core/app_widgets/back_button.dart';
import 'package:top_star/core/constants/app_color.dart';
import 'package:top_star/core/constants/dimesions.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
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
        toolbarHeight: Dimesion.screenHeight / 11,
        leading: backButton(),
        backgroundColor: AppColor.white,
        centerTitle: true,
        title: Text(
          "Contact Us",
          style: TextStyle(
              color: Colors.black,
              fontSize: Dimesion.font18,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: Dimesion.height30),
          child: Center(
            child: Container(
              width: Dimesion.screeWidth,
              child: Column(
                children: [
                  Text(
                    'Get in Touch',
                    style: GoogleFonts.aBeeZee(
                      textStyle: TextStyle(
                          color: AppColor.pink,
                          fontSize: Dimesion.font18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Gap(Dimesion.height5),
                  Text(
                    'If you have any inquiries get in touch with us.',
                    style: TextStyle(
                      color: AppColor.black,
                      fontSize: Dimesion.font14,
                    ),
                  ),
                  Gap(Dimesion.height5),
                  Text(
                    'We’ll happy to help you.',
                    style: TextStyle(
                      color: AppColor.black,
                      fontSize: Dimesion.font14,
                    ),
                  ),
                  Gap(Dimesion.height30),
                  Card(
                    margin: EdgeInsets.only(
                        left: Dimesion.width10 * 2.5, right: Dimesion.width10 * 2.5),
                    elevation: 2,
                    child: AppButtonWidget(
                      color: AppColor.white,
                      title: Row(
                        children: [
                          Icon(Icons.phone),
                          Gap(Dimesion.width5),
                          Text('+959 981234587')
                        ],
                      ),
                    ),
                  ),
                  Gap(Dimesion.height20),
                  Card(
                    margin: EdgeInsets.only(
                        left: Dimesion.width10 * 2.5, right: Dimesion.width10 * 2.5),
                    elevation: 2,
                    child: AppButtonWidget(
                      color: AppColor.white,
                      title: Row(
                        children: [
                          Icon(Icons.email_outlined),
                          Gap(Dimesion.width5),
                          Text('turiyar123@gmail.com')
                        ],
                      ),
                    ),
                  ),
                  Gap(Dimesion.height20),
                  Text(
                    'Social Media',
                    style: GoogleFonts.aBeeZee(
                      textStyle: TextStyle(
                          color: AppColor.pink,
                          fontSize: Dimesion.font18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Gap(Dimesion.height20),
                  Padding(
                    padding: EdgeInsets.only(left: Dimesion.width10*2.5, right: Dimesion.width10*5),
                    child: Row(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset('assets/icon/fb.png')),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Stay updated connect and engage with us on Facebook',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(Dimesion.height10*3),
                  Padding(
                    padding: EdgeInsets.only(left: Dimesion.width10*2.5, right: Dimesion.width10*5),
                    child: Row(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset('assets/icon/mes.png')),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Stay updated connect and engage with us on Messenger',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(Dimesion.height10*3),
                  Padding(
                    padding: EdgeInsets.only(left: Dimesion.width10*2.5, right: Dimesion.width10*5),
                    child: Row(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset('assets/icon/viber.png')),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Stay updated connect and engage with us on Viber',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade800,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
