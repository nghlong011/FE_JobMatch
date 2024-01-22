import 'package:flutter/material.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';

// ignore: must_be_immutable
class MessageItemWidget extends StatelessWidget {
  MessageItemWidget({
    Key? key,
    this.onTapRowesther,
  }) : super(
          key: key,
        );

  VoidCallback? onTapRowesther;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getVerticalSize(73),
      width: getHorizontalSize(327),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              height: getSize(56),
              width: getSize(56),
              decoration: BoxDecoration(
                color: appTheme.gray100,
                borderRadius: BorderRadius.circular(
                  getHorizontalSize(28),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: GestureDetector(
              onTap: () {
                onTapRowesther?.call();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: getSize(56),
                    width: getSize(56),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CustomImageView(
                          imagePath: ImageConstant.imgImage56x56,
                          height: getSize(56),
                          width: getSize(56),
                          radius: BorderRadius.circular(
                            getHorizontalSize(28),
                          ),
                          alignment: Alignment.center,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: getSize(16),
                            width: getSize(16),
                            decoration: BoxDecoration(
                              color: appTheme.tealA700,
                              borderRadius: BorderRadius.circular(
                                getHorizontalSize(8),
                              ),
                              border: Border.all(
                                color: theme.colorScheme.onPrimaryContainer
                                    .withOpacity(1),
                                width: getHorizontalSize(1),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 12,
                      top: 3,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "",
                          style: CustomTextStyles.titleMediumBold,
                        ),
                        Padding(
                          padding: getPadding(
                            top: 9,
                          ),
                          child: Text(
                            "xin chào tôi là .......",
                            style: CustomTextStyles.titleSmallBluegray400_1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: Padding(
                    padding: getPadding(
                      left: 10,
                      top: 7,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "10:20",
                          style: CustomTextStyles.labelLargeSemiBold,
                        ),
                        Container(
                          margin: getMargin(
                            top: 6,
                          ),
                          padding: getPadding(
                            left: 8,
                            top: 5,
                            right: 8,
                            bottom: 5,
                          ),
                          decoration: AppDecoration.fillPrimary.copyWith(
                            borderRadius: BorderRadiusStyle.circleBorder12,
                          ),
                          child: Text(
                            "",
                            style: theme.textTheme.labelMedium,
                          ),
                        ),
                      ],
                    ),
                  ),)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
