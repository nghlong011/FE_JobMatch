import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, AppRoutes.onboardingOneScreen);
      },
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: theme.colorScheme.primary,
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                svgPath: ImageConstant.imgGroup162797,
                height: getVerticalSize(60),
                width: getHorizontalSize(60),
                alignment: Alignment.center,
                margin: getMargin(bottom: 5),
              ),
              Text(
                'JobMatch',
                style: CustomTextStyles.titleMediumBold.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
