import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';
import 'package:nghlong011_s_application5/presentation/job_details_tab_container_screen/job_details_tab_container_screen.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/appbar_image.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/appbar_image_1.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/custom_app_bar.dart';
import 'package:nghlong011_s_application5/widgets/custom_elevated_button.dart';

import '../../widgets/custom_icon_button.dart';

// ignore: must_be_immutable
class CompanyDetailsScreen extends StatefulWidget {
  var jobDetails;
  CompanyDetailsScreen({
    Key? key,
    required this.jobDetails,
  }) : super(
          key: key,
        );

  @override
  CompanyDetailsScreenState createState() => CompanyDetailsScreenState();
}

class CompanyDetailsScreenState extends State<CompanyDetailsScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    List<dynamic> allJobs = [];
    if (widget.jobDetails != null) {
      var jobsEntity = widget.jobDetails['jobs'];
      if (jobsEntity != null) {
        for (var job in jobsEntity) {
          allJobs.add(job);
        }
      }
    } else {
      // Xử lý khi jobData là null
    }
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
                                  widget.jobDetails['companyName'] ?? '',
                                  style: CustomTextStyles.titleSmallBold,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                            child: SingleChildScrollView(
                                child: Padding(
                                    padding: getPadding(top: 0),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
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
                                                        padding: getPadding(
                                                            left: 24),
                                                        child: Text(
                                                            "Thông tin công ty",
                                                            style: CustomTextStyles
                                                                .titleMediumBluegray900)),
                                                    Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Container(
                                                            width:
                                                                getHorizontalSize(
                                                                    319),
                                                            margin: getMargin(
                                                                left: 31,
                                                                top: 13,
                                                                right: 24),
                                                            child: Html(
                                                              data: widget
                                                                      .jobDetails[
                                                                  'description'],
                                                            ))),
                                                  ]))
                                        ])))),
                        Expanded(
                            child: Align(
                                alignment: Alignment.center,
                                child: Padding(
                                    padding: getPadding(
                                        left: 24, top: 16, right: 24),
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: allJobs.length,
                                      itemBuilder: (context, jobIndex) {
                                        var jobs = widget.jobDetails['jobs']
                                            as List<dynamic>;
                                        var job = jobs[jobIndex];
                                        var jobTitle = job['title'];
                                        var jobSalary = job['salary'];
                                        var logo = widget.jobDetails['logo'];
                                        var companyName =
                                            widget.jobDetails['companyName'];
                                        var jobLocation = job['location'];
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    JobDetailsTabContainerScreen(
                                                        jobDetails: job,
                                                        company:
                                                            widget.jobDetails),
                                              ),
                                            );
                                          },
                                          child: Column(
                                            children: [
                                              Align(
                                                alignment: Alignment.center,
                                                child: Container(
                                                  padding: getPadding(
                                                    all: 16,
                                                  ),
                                                  decoration: AppDecoration
                                                      .outlineIndigo
                                                      .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder16,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          CustomIconButton(
                                                            height: getSize(48),
                                                            width: getSize(48),
                                                            padding: getPadding(
                                                                all: 8),
                                                            child:
                                                                Image.network(
                                                              logo,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          Expanded(
                                                              child: Padding(
                                                            padding: getPadding(
                                                              left: 12,
                                                              top: 4,
                                                              bottom: 2,
                                                            ),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  jobTitle,
                                                                  style: CustomTextStyles
                                                                      .labelLargeBlack900SemiBold,
                                                                ),
                                                                Text(
                                                                  companyName,
                                                                  style: CustomTextStyles
                                                                      .labelLargeBluegray300SemiBold,
                                                                ),
                                                              ],
                                                            ),
                                                          )),
                                                          CustomImageView(
                                                            svgPath:
                                                                ImageConstant
                                                                    .imgBookmark,
                                                            height: getSize(24),
                                                            width: getSize(24),
                                                            margin: getMargin(
                                                              bottom: 25,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Padding(
                                                          padding: getPadding(
                                                            top: 13,
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Expanded(
                                                                  child:
                                                                      CustomElevatedButton(
                                                                height:
                                                                    getVerticalSize(
                                                                        28),
                                                                text: jobSalary,
                                                                buttonTextStyle: theme
                                                                    .textTheme
                                                                    .labelLarge!,
                                                              )),
                                                              Expanded(
                                                                  child:
                                                                      CustomElevatedButton(
                                                                height:
                                                                    getVerticalSize(
                                                                        28),
                                                                text:
                                                                    jobLocation,
                                                                margin:
                                                                    getMargin(
                                                                  left: 8,
                                                                ),
                                                                buttonTextStyle: theme
                                                                    .textTheme
                                                                    .labelLarge!,
                                                              ))
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                  height: getVerticalSize(16)),
                                            ],
                                          ),
                                        );
                                      },
                                    ))))
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
}
