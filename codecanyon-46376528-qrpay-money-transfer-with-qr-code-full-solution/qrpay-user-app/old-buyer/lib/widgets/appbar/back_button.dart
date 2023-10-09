import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qrpay/custom_assets/assets.gen.dart';

import '../../utils/dimensions.dart';
import '../../views/others/custom_image_widget.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({Key? key, this.onTap}) : super(key: key);

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    bool isTablet() {
      return MediaQuery.of(context).size.shortestSide >= 600;
    }

    return Padding(
      padding: EdgeInsets.only(
        left: isTablet()
            ? Dimensions.paddingSize * 0.4
            : Dimensions.paddingSize * 0.6,
        top: isTablet() ? 0 : Dimensions.paddingSize * 0.6,
        bottom: isTablet() ? 0 : Dimensions.paddingSize * 0.6,
      ),
      child: GestureDetector(
        onTap: onTap ??
            () {
              Get.back();
            },
        child: CircleAvatar(
          backgroundColor: Theme.of(context).primaryColor,
          child: CustomImageWidget(
            path: Assets.icon.backward,
            height: Dimensions.heightSize * 2,
            width: Dimensions.widthSize * 2.2,
          ),
        ),
      ),
    );
  }
}