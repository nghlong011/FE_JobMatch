import 'package:flutter/material.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';
import 'package:nghlong011_s_application5/widgets/custom_elevated_button.dart';
import 'package:nghlong011_s_application5/widgets/custom_icon_button.dart';

class JobTypeScreen extends StatefulWidget {
  const JobTypeScreen({Key? key}) : super(key: key);

  @override
  State<JobTypeScreen> createState() => _JobTypeScreenState();
}

class _JobTypeScreenState extends State<JobTypeScreen> {
  int selectedOption = 1;
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.whiteA70001,
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 24, top: 13, right: 24, bottom: 13),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomImageView(
                          svgPath: ImageConstant.imgGroup162799,
                          height: getSize(24),
                          width: getSize(24),
                          alignment: Alignment.centerLeft,
                          onTap: () {
                            onTapImgImage(context);
                          }),
                      Padding(
                          padding: getPadding(top: 47),
                          child: Text("Chọn mục đích",
                              style: theme.textTheme.headlineSmall)),
                      Container(
                          width: getHorizontalSize(209),
                          margin: getMargin(top: 7),
                          child: Text(
                              "Bạn đang tìm kiếm công việc \n hay tìm kiếm ứng viên",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: CustomTextStyles.titleSmallBluegray400_1
                                  .copyWith(height: 1.57))),
                      Padding(
                          padding: getPadding(top: 38, bottom: 5),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedOption = 1;
                                        });
                                      },
                                      child: Container(
                                          margin: getMargin(right: 7),
                                          padding: getPadding(
                                              left: 18,
                                              top: 24,
                                              right: 18,
                                              bottom: 24),
                                          decoration:  selectedOption == 1 ? AppDecoration.outlinePrimary
                                              .copyWith(
                                              borderRadius:BorderRadiusStyle.roundedBorder24
                                          ):AppDecoration
                                              .outlineOnPrimary
                                              .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder24),
                                          child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                CustomIconButton(
                                                    height: getSize(64),
                                                    width: getSize(64),
                                                    padding: getPadding(all: 16),
                                                    child: CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgWork)),
                                                Padding(
                                                    padding: getPadding(top: 29),
                                                    child: Text("Tìm kiếm công việc",
                                                        textAlign: TextAlign.center,
                                                        style: theme.textTheme
                                                            .titleMedium)),

                                              ])),
                                    )),
                                Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedOption = 2;
                                        });
                                      },
                                      child: Container(
                                          margin: getMargin(left: 7),
                                          padding: getPadding(
                                              left: 14,
                                              top: 24,
                                              right: 14,
                                              bottom: 24),
                                          decoration: selectedOption == 2 ? AppDecoration.outlinePrimary
                                              .copyWith(
                                              borderRadius:BorderRadiusStyle.roundedBorder24
                                          ):AppDecoration
                                              .outlineOnPrimary
                                              .copyWith(
                                              borderRadius: BorderRadiusStyle
                                                  .roundedBorder24),
                                          child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                              MainAxisAlignment.center,
                                              children: [
                                                CustomIconButton(
                                                    height: getSize(64),
                                                    width: getSize(64),
                                                    padding: getPadding(all: 16),
                                                    child: CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgProfile)),
                                                Padding(
                                                    padding: getPadding(top: 29),
                                                    child: Text("Tìm kiếm ứng viên",
                                                        textAlign:
                                                        TextAlign.center,
                                                        style: theme.textTheme
                                                            .titleMedium)),
                                              ])),
                                    ))
                              ]))
                    ])),
            bottomNavigationBar: CustomElevatedButton(
                text: "Tiếp tục",
                margin: getMargin(left: 24, right: 24, bottom: 55),
                buttonStyle: CustomButtonStyles.fillPrimary,
                onTap: () {
                  onTapContinue(context);
                })));
  }


  onTapContinue(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.signUpCompleteAccountScreen,arguments: selectedOption);
  }

  onTapImgImage(BuildContext context) {
    Navigator.pop(context);
  }
}
