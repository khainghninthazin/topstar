import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:top_star/core/app_widgets/my_cache_img.dart';
import 'package:top_star/core/constants/dimesions.dart';
import 'package:top_star/models/product_model.dart';

import '../../core/constants/app_color.dart';
import '../../core/constants/data_constant.dart';

class ProductCardWidget extends StatelessWidget {
  final ProductData data;
  const ProductCardWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(Dimesion.radius5)
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyCacheImg(url: data.image.toString(), width: MediaQuery.of(context).size.width,height: Dimesion.screenHeight/7,
                boxfit: BoxFit.cover, borderRadius: BorderRadius.circular(Dimesion.radius5),),
              Container(
                padding: EdgeInsets.all(Dimesion.radius5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data.name.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: Dimesion.font14,color: AppColor.black)),
                    Text(data.brand.toString(),style: TextStyle(fontWeight: FontWeight.normal,fontSize: Dimesion.font12,color: AppColor.blackless),),
                    if(data.price.toString()!="null")
                      Text(
                        "${DataConstant.priceFormat.format(int.parse(data.price!))} MMK",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.bold, color: AppColor.primaryClr),
                      )
                    else
                      Text(
                        "${DataConstant.priceFormat.format(0)} MMK",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.bold, color: AppColor.primaryClr),
                      )
                  ],
                ),
              )
            ],
          ),
          Positioned(
              top: Dimesion.height5,
              right: Dimesion.width5,
              child: Container(
            padding: const EdgeInsets.all(3),
            decoration: const BoxDecoration(
                color: AppColor.white,
                shape: BoxShape.circle
            ),
            child: InkWell(
              onTap: (){

              },
              child: Icon(CupertinoIcons.heart,size: Dimesion.iconSize16,color: AppColor.primaryClr,),
            ),
          ))
        ],
      ),
    );
  }
}
