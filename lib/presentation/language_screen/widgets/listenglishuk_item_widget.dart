import 'package:flutter/material.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';
import 'package:nghlong011_s_application5/widgets/custom_checkbox_button.dart';

// ignore: must_be_immutable
class ListenglishukItemWidget extends StatelessWidget {
  ListenglishukItemWidget({Key? key})
      : super(
          key: key,
        );

  bool englishuk = false;

  @override
  Widget build(BuildContext context) {
    return CustomCheckboxButton(
      width: getHorizontalSize(295),
      text: "English (UK)",
      value: englishuk,
      textStyle: CustomTextStyles.titleMediumGray900,
      isRightCheck: true,
      onChange: (value) {
        englishuk = value;
      },
    );
  }
}
