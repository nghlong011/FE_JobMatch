import 'package:flutter/material.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';
import 'package:nghlong011_s_application5/presentation/home_container_screen/home_container_screen.dart';
import 'package:nghlong011_s_application5/widgets/custom_elevated_button.dart';

// ignore_for_file: must_be_immutable
class ApplyJobPopupDialog extends StatelessWidget {
  const ApplyJobPopupDialog({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return Container(
      width: getHorizontalSize(302),
      padding: getPadding(
        all: 32,
      ),
      decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgThumbsup11,
            height: getSize(101),
            width: getSize(101),
          ),
          Padding(
            padding: getPadding(
              top: 25,
            ),
            child: Text(
              "Thành công",
              style: CustomTextStyles.titleMediumBold,
            ),
          ),
          Padding(
            padding: getPadding(
              top: 9,
            ),
            child: Text(
              "Bạn đã ứng tuyển thành công",
              style: CustomTextStyles.titleSmallBluegray400,
            ),
          ),
          CustomElevatedButton(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeContainerScreen(),
                ),
              );
            },
            height: getVerticalSize(46),
            width: getHorizontalSize(127),
            text: "Đóng",
            margin: getMargin(
              top: 23,
            ),
            buttonStyle: CustomButtonStyles.fillPrimaryTL20,
            buttonTextStyle: CustomTextStyles.titleSmallGray5001,
          ),
        ],
      ),
    );
  }
}
