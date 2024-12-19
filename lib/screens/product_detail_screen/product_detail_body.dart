import 'package:flutter/material.dart';
import 'package:top_star/core/constants/app_color.dart';
import 'package:top_star/core/constants/dimesions.dart';
import 'package:top_star/models/product_model.dart';


class ProductDetailBodyView extends StatefulWidget {
  final ProductData data;
  const ProductDetailBodyView({
    super.key, required this.data,
  });

  @override
  State<ProductDetailBodyView> createState() => _ProductDetailBodyViewState();
}
List<String> sizeArray = ["1"];

class _ProductDetailBodyViewState extends State<ProductDetailBodyView> {
  int _sizeIndex = -1;
  int _colorIndex = -1;

  List<String> options = [
    '33', '34', '35',
  ];

  List<String> optionsColor = [
    '33', '34', '35',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: Dimesion.width20),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           SizedBox(
            height: Dimesion.height20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.data.name.toString() ?? '',
                style:
                     TextStyle(fontSize: Dimesion.font16, fontWeight: FontWeight.bold),
              ),
              Text(
                '${widget.data.stock ?? 0} Stocks',
                style: TextStyle(
                    fontSize: Dimesion.font14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
           SizedBox(
            height: Dimesion.height10,
          ),
          Text(
            widget.data.brand!.name.toString() ?? '',
            style:  TextStyle(fontSize: Dimesion.font12, fontWeight: FontWeight.normal,color: AppColor.blackless),
          ),
           SizedBox(
            height: Dimesion.height15,
          ),
          Text(
            '${widget.data.price.toString()!="null"?widget.data.price:"0"} MMK',
            style: TextStyle(
                fontSize: Dimesion.font16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
           SizedBox(
            height: Dimesion.height30,
          ),

          // size
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(widget.data.variations!.length!=0)
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Select Size',
                        style:
                        TextStyle(fontSize: Dimesion.font16-1, fontWeight: FontWeight.bold),
                      ),
                      //const Spacer(),
                      SizedBox(
                        height: Dimesion.height10,
                      ),
                      Wrap(
                        spacing: 9.0, // gap between adjacent chips
                        runSpacing: 3.0, // gap between lines
                        children: <Widget>[
                          for (int index = 0;
                          index < widget.data.variations!.length;
                          index++)
                            FilterChip(
                              shape: StadiumBorder(side: BorderSide(color: AppColor.grey),),
                              backgroundColor: _sizeIndex == index?AppColor.primaryClr:AppColor.white,
                              labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              label: Text(
                                "${widget.data.variations![index].variationTypeName}",
                                style: TextStyle(
                                    fontSize: Dimesion.font12,
                                    fontWeight: FontWeight.normal,
                                    color: _sizeIndex==index?AppColor.white:AppColor.black),
                              ),
                              onSelected: (bool value) {
                                setState(() {
                                  _sizeIndex = index ?? 0;

                                });


                              },
                            )
                        ],
                      )

                    ],
                  ),
                ),
              /*Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Select Color',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    //const Spacer(),
                    const SizedBox(
                      height: 10,
                    ),
                    Wrap(
                      runSpacing: 7,
                      alignment: WrapAlignment.end,
                      children: options?.map((e) {
                            var index =
                                options?.indexOf(e);
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _colorIndex = index ?? 0;
                                 // color = widget.productData.englishColors?[index ?? 0] ?? '';
                                });
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 3),
                                // padding: const EdgeInsets.symmetric(horizontal: 10),
                                height: Dimesion.height40,
                                width: Dimesion.width30,
                                decoration: BoxDecoration(
                                    color: _colorIndex == index
                                        ? AppColor.primaryClr
                                        : Colors.white,
                                    border: Border.all(color: Colors.grey),
                                    shape: BoxShape.circle),
                                child: Center(
                                    child: Text(
                                  "",
                                  style: TextStyle(
                                      color: _colorIndex == index
                                          ? Colors.white
                                          : Colors.black),
                                )),
                              ),
                            );
                          }).toList() ??
                          [],
                    ),
                  ],
                ),
              ),*/
            ],
          ),

           SizedBox(
            height: Dimesion.height20,
          ),
          //whole sale
          /*Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                'Wholesale',
                style: TextStyle(fontSize: Dimesion.font16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        textAlign: TextAlign.end,
                        softWrap: true,
                        ' 5 Quantity - 15000 MMK',
                        style: TextStyle(
                          fontSize: Dimesion.font16-1,
                          fontWeight: FontWeight.normal,
                          color: AppColor.blackless
                        ),
                      ),
                      Text(
                        textAlign: TextAlign.end,
                        softWrap: true,
                        ' 3 Quantity - 11000 MMK',
                        style: TextStyle(
                            fontSize: Dimesion.font16-1,
                            fontWeight: FontWeight.normal,
                            color: AppColor.blackless
                        ),
                      )
                    ]),
              ),
            ],
          ),*/

          const SizedBox(
            height: 20,
          ),

          //product detail

          const Text(
            'Product description',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 17,
          ),
          Text(widget.data.description.toString() ?? ''),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
