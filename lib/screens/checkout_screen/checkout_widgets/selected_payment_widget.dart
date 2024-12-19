import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:top_star/core/app_data.dart';


import '../../../core/app_widgets/my_cache_img.dart';
import '../../../core/app_widgets/view_image_screen.dart';
import '../../../core/constants/dimesions.dart';
import '../../../services/toast_service.dart';

class SelectPaymentWidget extends StatelessWidget {
  /*final PaymentData paymentData;*/
  const SelectPaymentWidget({super.key, /*required this.paymentData*/});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimesion.screeWidth,
      child: Row(
        children: [
          MyCacheImg(
              height: Dimesion.height40,
              width: Dimesion.height40,
              url: AppPngs.testNetWorkPaymentImg ?? "",
              boxfit: BoxFit.cover,
              borderRadius: BorderRadius.circular(Dimesion.radius15 / 2)),
          SizedBox(
            width: Dimesion.width5,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name" ?? "",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  "0987654321" ?? "",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
          SizedBox(
            width: Dimesion.width5,
          ),
          /*IconButton(
              onPressed: () {
                Clipboard.setData(
                    ClipboardData(text: "0987654321" ?? ""));
                ToastService.successToast("Copied Account Number ");
              },
              icon: const Icon(Icons.copy_all)),
          IconButton(
              onPressed: () =>
                  Get.to(() => ViewImageScreen(imgUrl: "" ?? "")),
              icon: const Icon(Icons.qr_code_scanner_outlined)),*/
          SizedBox(
            width: Dimesion.width5,
          ),
        ],
      ),
    );
  }
}
