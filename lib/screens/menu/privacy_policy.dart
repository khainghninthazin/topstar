import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_star/core/app_widgets/back_button.dart';
import 'package:top_star/core/constants/app_color.dart';
import 'package:top_star/core/constants/dimesions.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
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
          "Privacy Policy",
          style: TextStyle(
              color: Colors.black,
              fontSize: Dimesion.font18,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              top: Dimesion.height15,
              left: Dimesion.width10 * 2,
              right: Dimesion.width10 * 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Condition & Attending',
                style: GoogleFonts.aBeeZee(
                  textStyle: TextStyle(
                      color: AppColor.pink,
                      fontSize: Dimesion.font18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: Dimesion.height10, left: Dimesion.width5 / 2),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    "Lorem ipsum dolor sit amet consectetur. Risus quis praesent pellentesque pharetra accumsan dolor ullamcorper vel sit. Sociis facilisis tincidunt a feugiat porta integer pulvinar. Porttitor turpis non urna sed et. Risus neque nunc lacus consectetur at tellus nisl a. Et non turpis suspendisse ipsum. Odio cras scelerisque mauris integer nunc convallis pretium.",
                    //style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Gap(Dimesion.height20),
              Text(
                'Terms & Conditions',
                style: GoogleFonts.aBeeZee(
                  textStyle: TextStyle(
                      color: AppColor.pink,
                      fontSize: Dimesion.font18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: Dimesion.height10, left: Dimesion.width5 / 2),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    "Lorem ipsum dolor sit amet consectetur. Risus quis praesent pellentesque pharetra accumsan dolor ullamcorper vel sit. Sociis facilisis tincidunt a feugiat porta integer pulvinar. Porttitor turpis non urna sed et. Risus neque nunc lacus consectetur at tellus nisl a. Et non turpis suspendisse ipsum. Odio cras scelerisque mauris integer nunc convallis pretium. Posuere amet proin viverra feugiat. Ultrices adipiscing blandit lacus diam in cursus lorem convallis sed. Et tristique morbi ut mattis. At id eros nulla et ultrices arcu. Nibh sit pulvinar suspendisse nulla vitae id sem blandit adipiscing. Sed neque ultrices scelerisque tortor a ultrices nulla. Vestibulum at donec interdum volutpat. Amet tristique sed egestas eget tellus pretium tellus.",
                    //style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Gap(Dimesion.height10)
            ],
          ),
        ),
      ),
    );
  }
}
