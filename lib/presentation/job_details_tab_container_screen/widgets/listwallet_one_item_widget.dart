import 'package:flutter/material.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';
import 'package:nghlong011_s_application5/widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class ListwalletOneItemWidget extends StatelessWidget {
  const ListwalletOneItemWidget({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    var imgs = [
      ImageConstant.imgWallet,
      ImageConstant.imgWorkDeepPurple400,
      ImageConstant.imgProfile
    ];
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: 1,
      itemBuilder: (context, index) {
        var img = imgs[index];
        return SizedBox(
          width: getHorizontalSize(67),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomIconButton(
                height: getSize(48),
                width: getSize(48),
                padding: getPadding(
                  all: 12,
                ),
                decoration: IconButtonStyleHelper.fillTealA,
                child: CustomImageView(
                  svgPath: img,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 9,
                ),
                child: Text(
                  "aaaa",
                  style: CustomTextStyles.labelLargeBluegray300,
                ),
              ),
              Padding(
                padding: getPadding(
                  top: 9,
                ),
                child: Text(
                  "bbbb",
                  style: CustomTextStyles.titleSmallPrimarySemiBold,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
