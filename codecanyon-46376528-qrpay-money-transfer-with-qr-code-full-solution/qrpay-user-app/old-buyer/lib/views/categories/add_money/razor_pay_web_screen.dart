import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

import '../../../backend/services/notification_service.dart';
import '../../../backend/utils/custom_loading_api.dart';
import '../../../controller/categories/deposit/deposti_controller.dart';
import '../../../language/english.dart';
import '../../../routes/routes.dart';
import '../../../widgets/appbar/appbar_widget.dart';

class RazorPayWebPaymentScreen extends StatelessWidget {
  RazorPayWebPaymentScreen({super.key});

  final controller = Get.put(DepositController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAllNamed(Routes.bottomNavBarScreen);
          NotificationService.showLocalNotification(
            title: 'Success',
            body:
                'Your money has been add successfully. Thanks for using QRPAY',
          );
        return false;
      },
      child: Scaffold(
        appBar: AppBarWidget(
          homeButtonShow: true,
          text: Strings.razorPayPayment,
          onTapLeading: () {
              NotificationService.showLocalNotification(
            title: 'Success',
            body:
                'Your money has been add successfully. Thanks for using QRPAY',
          );
            Get.offAllNamed(Routes.bottomNavBarScreen);
          },
        ),
        body: Obx(
          () => controller.isLoading
              ? const CustomLoadingAPI()
              : _bodyWidget(context),
        ),
      ),
    );
  }

  _bodyWidget(BuildContext context) {
    final data = controller.addMoneyRazorPayInsertModel.data;
    var paymentUrl = data.url;

    return InAppWebView(
      initialUrlRequest: URLRequest(url: Uri.parse(paymentUrl)),
      onWebViewCreated: (InAppWebViewController controller) {},
      onProgressChanged: (InAppWebViewController controller, int progress) {},
    );
  }
}
