import 'package:cached_network_image/cached_network_image.dart';
import 'package:circular_image/circular_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:top_star/controllers/auth_controller.dart';
import 'package:top_star/core/app_widgets/my_cache_img.dart';
import 'package:top_star/core/app_widgets/view_image_screen.dart';
import 'package:top_star/core/constants/app_color.dart';
import 'package:top_star/core/constants/dimesions.dart';
import 'package:top_star/models/post_model.dart';
import 'package:top_star/screens/nav/comment_alert.dart';
import 'package:top_star/screens/nav/newfeed_detail.dart';


import '../../controllers/product_controller.dart';
import '../../core/app_widgets/footer_widget.dart';
import '../../core/app_widgets/photo_grid.dart';
import '../../router/route_helper.dart';


class NewFeedWidget extends StatefulWidget {
  final ProductController controller;
  final AuthController authController;
  const NewFeedWidget({super.key, required this.controller, required this.authController});

  @override
  State<NewFeedWidget> createState() => _NewFeedWidgetState();
}

class _NewFeedWidgetState extends State<NewFeedWidget> {
  late RefreshController refreshController;
  @override
  void initState() {
  WidgetsBinding.instance.addPostFrameCallback((_){

  refreshController = RefreshController(initialRefresh: false);

  });
  super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(()=>widget.controller.allPosts.length!=0?
    Container(
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: widget.controller.allPosts.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          PostData data=widget.controller.allPosts[index];
          return GestureDetector(
            onTap: () => {

              Get.toNamed(RouteHelper.feeddetail,arguments: NewfeedDetailPage(id: data.id!.toInt(), controller: widget.controller, authController: widget.authController, postData: data,))

            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Dimesion.radius15)),
              color: Colors.white,
              elevation: 1,
              child: Container(
                padding: EdgeInsets.all(Dimesion.size10),
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircularImage(source: "assets/img/logo.png",radius: Dimesion.radius15,borderWidth: 1,borderColor: Colors.white,),
                        Gap(Dimesion.width10),
                        Text(
                          textAlign: TextAlign.center,
                          data.poster.toString(),
                          style: GoogleFonts.outfit(textStyle:  TextStyle(color: AppColor.black,fontSize: Dimesion.font16,fontWeight: FontWeight.bold)),
                        ),                      ],
                    ),
                    Gap(Dimesion.width10),
                    Text(data.description.toString(),style: TextStyle(color: Colors.black,fontSize: Dimesion.font14,fontWeight: FontWeight.normal),),
                    Gap(Dimesion.width15),

                    if(data.images!.length==1)
                      Container(
                        height: Dimesion.screenHeight/4,
                        child: MyCacheImg(url: data.images![0].path.toString(), boxfit: BoxFit.fill, borderRadius: BorderRadius.zero),
                      ),
                    if(data.images!.length!=3 && data.images!.length==2 && data.images!.length!=1)
                      Container(
                        height: Dimesion.screenHeight/5.1,
                        child: Row(
                          children: [
                            Flexible(child: MyCacheImg(url: data.images![0].path.toString(), boxfit: BoxFit.fill, borderRadius: BorderRadius.zero,height: Dimesion.screenHeight/6)),
                            Gap(Dimesion.width5-2),
                            Flexible(child: MyCacheImg(url: data.images![1].path.toString(), boxfit: BoxFit.fill, borderRadius: BorderRadius.zero,height: Dimesion.screenHeight/6))
                          ],
                        ),
                      ),
                    if(data.images!.length==3 && data.images!.length!=1)
                      Flexible(child: Container(
                        child: Column(
                          children: [
                            MyCacheImg(url: data.images![0].path.toString(), boxfit: BoxFit.fill, borderRadius: BorderRadius.zero,width: Dimesion.screeWidth,height: Dimesion.screenHeight/4),
                            Gap(Dimesion.height5-2),
                            Row(
                              children: [
                                Flexible(child: MyCacheImg(url: data.images![1].path.toString(), boxfit: BoxFit.fill, borderRadius: BorderRadius.zero,height: Dimesion.screenHeight/6)),
                                Gap(Dimesion.width5-2),
                                Flexible(child: MyCacheImg(url: data.images![2].path.toString(), boxfit: BoxFit.fill, borderRadius: BorderRadius.zero,height: Dimesion.screenHeight/6)),
                              ],
                            )
                          ],
                        ),
                      )),
                    if(data.images!.length>3)
                      Container(
                        height: Dimesion.screenHeight/2.1,
                        child: PhotoGrid(
                          imageUrls: data.images!,
                          onImageClicked: (i) => {
                            Get.toNamed(RouteHelper.viewImage,arguments: ViewImageScreen(imgUrl: data.images![i].path.toString()))
                          },
                          onExpandClicked: () => {
                            Get.toNamed(RouteHelper.feeddetail,arguments: NewfeedDetailPage(id: data.id!.toInt(), controller: widget.controller, authController: widget.authController, postData: data,))
                          },
                          maxImages: 4,
                        ),
                      ),
                    /*Container(
                      height: Dimesion.screenHeight/7,
                      child: GridView.builder(
                          itemCount: data.images!.length,
                          gridDelegate:

                          // crossAxisCount stands for number of columns you want for displaying
                          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                          itemBuilder: (BuildContext context, int index) {
                            // return your grid widget here, like how your images will be displayed
                            return Container(
                              margin: EdgeInsets.only(right: Dimesion.width5),
                              child: MyCacheImg(url: data.images![index].path.toString(), boxfit: BoxFit.cover, borderRadius: BorderRadius.circular(Dimesion.radius5),),
                            );
                          }),
                    ),*/
                    Gap(Dimesion.width10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(data.comments!.length.toString()+" Comments",style: TextStyle(color: Colors.grey,fontSize: Dimesion.font14),),
                        InkWell(
                          onTap: (){
                            setState(() {
                              showCupertinoModalBottomSheet(
                                context: context,
                                builder: (context) => CommentAlertWidget(postData: data, controller: widget.controller, authController: widget.authController,),
                              );
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(Dimesion.width10, Dimesion.width5, Dimesion.width10, Dimesion.width5),
                            decoration: BoxDecoration(
                                color: AppColor.primaryClr,
                                borderRadius: BorderRadius.circular(Dimesion.radius15)
                            ),
                            child: Row(
                              children: [
                                Icon(CupertinoIcons.chat_bubble,color: Colors.white,size: Dimesion.iconSize25,),
                                SizedBox(width: 7,),
                                Text("Comment",style: TextStyle(color: Colors.white,fontSize: Dimesion.font12,fontWeight: FontWeight.bold),)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    )
        :Container());
    /*Container(
      height: Dimesion.screenHeight,
      width: Dimesion.screeWidth,
      child: SmartRefresher(
        controller: refreshController,
        enablePullDown: false,
        enablePullUp: false,
        onRefresh: _onRefresh,
        footer: Obx(
              () => footer(canLoadMore: widget.controller.canLoadMorePost.value),
        ),
        onLoading: _onLoading,
        header: const WaterDropHeader(),
        physics: const NeverScrollableScrollPhysics(),
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: widget.controller.allPosts.length,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            PostData data=widget.controller.allPosts[index];
            return GestureDetector(
              onTap: () => {

                Get.toNamed(RouteHelper.feeddetail,arguments: NewfeedDetailPage(id: data.id!.toInt(), controller: widget.controller, authController: widget.authController, postData: data,))

              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Dimesion.radius15)),
                color: Colors.white,
                elevation: 1,
                child: Container(
                  padding: EdgeInsets.all(Dimesion.size10),
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircularImage(source: "assets/img/logo.png",radius: Dimesion.radius15,borderWidth: 1,borderColor: Colors.white,),
                          Gap(Dimesion.width10),
                          Text(
                            textAlign: TextAlign.center,
                            data.poster.toString(),
                            style: GoogleFonts.outfit(textStyle:  TextStyle(color: AppColor.black,fontSize: Dimesion.font16,fontWeight: FontWeight.bold)),
                          ),                      ],
                      ),
                      Gap(Dimesion.width10),
                      Text(data.description.toString(),style: TextStyle(color: Colors.black,fontSize: Dimesion.font14,fontWeight: FontWeight.normal),),
                      Gap(Dimesion.width15),

                      if(data.images!.length==1)
                        Container(
                          height: Dimesion.screenHeight/4,
                          child: MyCacheImg(url: data.images![0].path.toString(), boxfit: BoxFit.fill, borderRadius: BorderRadius.zero),
                        ),
                      if(data.images!.length!=3 && data.images!.length==2 && data.images!.length!=1)
                        Container(
                          height: Dimesion.screenHeight/5.1,
                          child: Row(
                            children: [
                              Flexible(child: Image.network(data.images![0].path.toString(),height: Dimesion.screenHeight/6,fit: BoxFit.fill,)),
                              Gap(Dimesion.width5-2),
                              Flexible(child: Image.network(data.images![1].path.toString(),height: Dimesion.screenHeight/6,fit: BoxFit.fill,)),
                            ],
                          ),
                        ),
                      if(data.images!.length==3 && data.images!.length!=1)
                        Flexible(child: Container(
                          child: Column(
                            children: [
                              Image.network(data.images![0].path.toString(),height: Dimesion.screenHeight/4,fit: BoxFit.fill,width: Dimesion.screeWidth,),
                              Gap(Dimesion.height5-2),
                              Row(
                                children: [
                                  Flexible(child: Image.network(data.images![1].path.toString(),height: Dimesion.screenHeight/6,fit: BoxFit.fill,)),
                                  Gap(Dimesion.width5-2),
                                  Flexible(child: Image.network(data.images![2].path.toString(),height: Dimesion.screenHeight/6,fit: BoxFit.fill,)),
                                ],
                              )
                            ],
                          ),
                        )),
                      if(data.images!.length>3)
                        Container(
                          height: Dimesion.screenHeight/2.1,
                          child: PhotoGrid(
                            imageUrls: data.images!,
                            onImageClicked: (i) => print('Image $i was clicked!'),
                            onExpandClicked: () => print('Expand Image was clicked'),
                            maxImages: 4,
                          ),
                        ),

                      *//*Container(
                      height: Dimesion.screenHeight/7,
                      child: GridView.builder(
                          itemCount: data.images!.length,
                          gridDelegate:

                          // crossAxisCount stands for number of columns you want for displaying
                          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                          itemBuilder: (BuildContext context, int index) {
                            // return your grid widget here, like how your images will be displayed
                            return Container(
                              margin: EdgeInsets.only(right: Dimesion.width5),
                              child: MyCacheImg(url: data.images![index].path.toString(), boxfit: BoxFit.cover, borderRadius: BorderRadius.circular(Dimesion.radius5),),
                            );
                          }),
                    ),*//*
                      Gap(Dimesion.width10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(data.comments!.length.toString()+" Comments",style: TextStyle(color: Colors.grey,fontSize: Dimesion.font14),),
                          InkWell(
                            onTap: (){
                              showCupertinoModalBottomSheet(
                                context: context,
                                builder: (context) => CommentAlertWidget(postData: data, controller: widget.controller, authController: widget.authController,),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.fromLTRB(Dimesion.width10, Dimesion.width5, Dimesion.width10, Dimesion.width5),
                              decoration: BoxDecoration(
                                  color: AppColor.primaryClr,
                                  borderRadius: BorderRadius.circular(Dimesion.radius15)
                              ),
                              child: Row(
                                children: [
                                  Icon(CupertinoIcons.chat_bubble,color: Colors.white,size: Dimesion.iconSize25,),
                                  SizedBox(width: 7,),
                                  Text("Comment",style: TextStyle(color: Colors.white,fontSize: Dimesion.font12,fontWeight: FontWeight.bold),)
                                ],
                              ),
                            ),
                          )
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    )*/
  }

}
