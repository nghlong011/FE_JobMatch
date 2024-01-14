import 'package:nghlong011_s_application5/presentation/apply_job_screen/apply_job_screen.dart';

import '../../widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/appbar_image.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/appbar_image_1.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/appbar_title.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/custom_app_bar.dart';
import 'package:nghlong011_s_application5/widgets/custom_elevated_button.dart';

class JobDetailsTabContainerScreen extends StatefulWidget {
  final Map<String, dynamic> jobDetails;
  const JobDetailsTabContainerScreen({
    Key? key,
    required this.jobDetails,
  }) : super(
          key: key,
        );

  @override
  JobDetailsTabContainerScreenState createState() =>
      JobDetailsTabContainerScreenState();
}

class JobDetailsTabContainerScreenState
    extends State<JobDetailsTabContainerScreen> with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var imgs = [
      ImageConstant.imgWallet,
      ImageConstant.imgWorkDeepPurple400,
      ImageConstant.imgProfile
    ];
    mediaQueryData = MediaQuery.of(context);
    print(widget.jobDetails);
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA70001,
        appBar: CustomAppBar(
          leadingWidth: getHorizontalSize(48),
          leading: AppbarImage1(
            svgPath: ImageConstant.imgGroup162799,
            margin: getMargin(
              left: 24,
              top: 13,
              bottom: 13,
            ),
          ),
          centerTitle: true,
          title: AppbarTitle(
            text: widget.jobDetails['title'],
          ),
          actions: [
            AppbarImage(
              svgPath: ImageConstant.imgBookmark,
              margin: getMargin(
                left: 16,
                top: 13,
                right: 16,
                bottom: 13,
              ),
            ),
          ],
        ),
        body: SizedBox(
          height: getVerticalSize(688),
          width: double.maxFinite,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                width: double.maxFinite,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: getPadding(
                      top: 30,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: getMargin(
                            right: 24,
                          ),
                          padding: getPadding(
                            left: 72,
                            top: 24,
                            right: 72,
                            bottom: 24,
                          ),
                          decoration: AppDecoration.outlineIndigo.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder16,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: getSize(79),
                                width: getSize(79),
                                padding: getPadding(
                                  all: 19,
                                ),
                                decoration: AppDecoration.fillGray.copyWith(
                                  borderRadius:
                                      BorderRadiusStyle.roundedBorder39,
                                ),
                                child: CustomImageView(
                                  url: widget.jobDetails['logo'],
                                  height: getSize(40),
                                  width: getSize(40),
                                  alignment: Alignment.center,
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  top: 16,
                                ),
                                child: Text(
                                  widget.jobDetails['title'],
                                  style: CustomTextStyles.titleSmallBold,
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  top: 7,
                                ),
                                child: Text(
                                  "Shopee Sg",
                                  style: theme.textTheme.labelLarge,
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  left: 1,
                                  top: 12,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomElevatedButton(
                                      height: getVerticalSize(28),
                                      width: getHorizontalSize(69),
                                      text: "Fulltime",
                                      buttonTextStyle:
                                          theme.textTheme.bodySmall!,
                                    ),
                                    CustomElevatedButton(
                                      height: getVerticalSize(28),
                                      width: getHorizontalSize(104),
                                      text: "Two days ago",
                                      margin: getMargin(
                                        left: 9,
                                      ),
                                      buttonTextStyle:
                                          theme.textTheme.bodySmall!,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            height: getVerticalSize(105),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CustomIconButton(
                                        height: getSize(48),
                                        width: getSize(48),
                                        padding: getPadding(
                                          all: 12,
                                        ),
                                        decoration:
                                            IconButtonStyleHelper.fillTealA,
                                        child: CustomImageView(
                                          svgPath: imgs[0],
                                        ),
                                      ),
                                      Padding(
                                        padding: getPadding(
                                          top: 9,
                                        ),
                                        child: Text(
                                          "Lương",
                                          style: CustomTextStyles
                                              .labelLargeBluegray300,
                                        ),
                                      ),
                                      Padding(
                                        padding: getPadding(
                                          top: 9,
                                        ),
                                        child: Text(
                                          widget.jobDetails['salary'],
                                          style: CustomTextStyles
                                              .titleSmallPrimarySemiBold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: getHorizontalSize(60),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CustomIconButton(
                                        height: getSize(48),
                                        width: getSize(48),
                                        padding: getPadding(
                                          all: 12,
                                        ),
                                        decoration:
                                            IconButtonStyleHelper.fillTealA,
                                        child: CustomImageView(
                                          svgPath: imgs[1],
                                        ),
                                      ),
                                      Padding(
                                        padding: getPadding(
                                          top: 9,
                                        ),
                                        child: Text(
                                          "Địa điểm",
                                          style: CustomTextStyles
                                              .labelLargeBluegray300,
                                        ),
                                      ),
                                      Padding(
                                        padding: getPadding(
                                          top: 9,
                                        ),
                                        child: Text(
                                          widget.jobDetails['location'],
                                          style: CustomTextStyles
                                              .titleSmallPrimarySemiBold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: getHorizontalSize(60),
                                ),
                                Flexible(
                                  flex: 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CustomIconButton(
                                        height: getSize(48),
                                        width: getSize(48),
                                        padding: getPadding(
                                          all: 12,
                                        ),
                                        decoration:
                                            IconButtonStyleHelper.fillTealA,
                                        child: CustomImageView(
                                          svgPath: imgs[2],
                                        ),
                                      ),
                                      Padding(
                                        padding: getPadding(
                                          top: 9,
                                        ),
                                        child: Text(
                                          "Kinh nghiệm",
                                          style: CustomTextStyles
                                              .labelMediumBluegray300,
                                        ),
                                      ),
                                      Expanded(
                                          child: Padding(
                                            padding: getPadding(
                                              top: 9,
                                            ),
                                            child: Text(
                                          widget.jobDetails['workExperience'],
                                          style: CustomTextStyles
                                              .titleSmallPrimarySemiBold,
                                        ),
                                      ))
                                    ],
                                  ),
                                ),
                              ],
                            )),

                        Expanded(
                            child: SingleChildScrollView(
                                child: Padding(
                                    padding: getPadding(top: 0),
                                    child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding: getPadding(top: 20),
                                              child: Column(
                                                  crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                        padding: getPadding(left: 24),
                                                        child: Text("Job Description",
                                                            style: CustomTextStyles
                                                                .titleMediumBluegray900)),
                                                    Align(
                                                        alignment: Alignment.center,
                                                        child: Container(
                                                            width: getHorizontalSize(319),
                                                            margin: getMargin(
                                                                left: 31,
                                                                top: 13,
                                                                right: 24),
                                                            child: Text(
                                                                widget.jobDetails['description'],
                                                                overflow:
                                                                TextOverflow.ellipsis,
                                                                style: CustomTextStyles
                                                                    .titleSmallGray600
                                                                    .copyWith(
                                                                    height: 1.57)))),
                                                    Container(
                                                        margin: getMargin(bottom: 3),
                                                        padding: getPadding(
                                                            left: 24,
                                                            top: 28,
                                                            right: 24,
                                                            bottom: 28),
                                                        decoration: AppDecoration
                                                            .gradientGrayToGray,
                                                        child: CustomElevatedButton(
                                                            text: "Apply Now",
                                                            margin: getMargin(bottom: 12),
                                                            buttonStyle: CustomButtonStyles
                                                                .fillPrimary,
                                                            onTap: () {
                                                              Navigator.pushReplacement(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder: (context) => ApplyJobScreen(jobDetails: widget.jobDetails),
                                                                ),
                                                              );
                                                            }
                                                            )
                                                    )
                                                  ]))
                                        ]
                                    )
                                )
                            )
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onTapApplynow(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.applyJobScreen);
  }
}
