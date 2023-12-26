import 'package:flutter/material.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';
import 'package:nghlong011_s_application5/widgets/custom_elevated_button.dart';

// ignore: must_be_immutable
class SliderthebestapItemWidget extends StatelessWidget {
  SliderthebestapItemWidget({
    Key? key,
    this.onTapLabel,
  }) : super(
          key: key,
        );

  VoidCallback? onTapLabel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: getPadding(
          left: 39,
          top: 32,
          right: 39,
          bottom: 32,
        ),
        decoration: AppDecoration.fillOnPrimaryContainer.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder32,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: getHorizontalSize(246),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Ứng dụng tốt nhất cho vệc ",
                      style: theme.textTheme.headlineSmall,
                    ),
                    TextSpan(
                      text: "Tìm Kiếm Việc Làm",
                      style: theme.textTheme.headlineSmall,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: getPadding(
                top: 19,
              ),
              child: Expanded(
                child: Text(
                  "Tìm việc mơ ước của bạn một cách dễ dàng và nhanh chóng. Với công nghệ tiên tiến, ứng dụng chúng tôi sẽ giúp bạn tìm được sự nghiệp lý tưởng! ",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: CustomTextStyles.titleSmallBluegray300.copyWith(
                    height: 1.57,
                  ),
                ),
              ),
            ),
            CustomElevatedButton(
              width: getHorizontalSize(101),
              text: "Tiếp",
              margin: getMargin(
                top: 30,
              ),
              buttonStyle: CustomButtonStyles.fillPrimary,
              onTap: () {
                onTapLabel?.call();
              },
            ),
          ],
        ),
      ),
    );
  }
}
