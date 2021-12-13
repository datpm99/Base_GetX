import 'package:base_getx/const/const.dart';
import 'package:base_getx/const/theme/styles.dart';
import 'package:base_getx/widgets/img_asset_widget.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ImgAssetWidget(img: 'assets/images/logo.png', size: 200),
            Text('Flutter Base GetX', style: Styles.bigTextBold())
                .shimmer(primaryColor: Styles.primaryColor),
          ],
        ),
      ),
    );
  }
}
