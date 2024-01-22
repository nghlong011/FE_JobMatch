import 'package:flutter_html/flutter_html.dart';
import 'package:nghlong011_s_application5/presentation/read_cv/read_cv.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/appbar_image.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/appbar_image_1.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/custom_app_bar.dart';

// ignore: must_be_immutable
class PostJobDetailsTabContainerScreen extends StatefulWidget {
  final Map<String, dynamic> jobDetails;
  PostJobDetailsTabContainerScreen({
    Key? key,
    required this.jobDetails,
  }) : super(
          key: key,
        );

  @override
  _PostJobDetailsTabContainerScreen createState() =>
      _PostJobDetailsTabContainerScreen();
}

class _PostJobDetailsTabContainerScreen
    extends State<PostJobDetailsTabContainerScreen>
    with TickerProviderStateMixin {
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA70001,
        appBar: CustomAppBar(
          leadingWidth: getHorizontalSize(48),
          leading: AppbarImage1(
            onTap: () {
              onTapArrowbackone(context);
            },
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: getMargin(
                            left: 24,
                            right: 24,
                          ),
                          padding: getPadding(
                            all: 24,
                          ),
                          decoration: AppDecoration.outlineIndigo.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder16,
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: getPadding(
                                  top: 16,
                                ),
                                child: Text(
                                  widget.jobDetails['title'],
                                  style: CustomTextStyles.titleSmallBold,
                                ),
                              ),
                              Container(
                                  margin: getMargin(
                                    top: 20,
                                  ),
                                  height: getVerticalSize(105),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            CustomIconButton(
                                              height: getSize(48),
                                              width: getSize(48),
                                              padding: getPadding(
                                                all: 12,
                                              ),
                                              decoration: IconButtonStyleHelper
                                                  .fillTealA,
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
                                            Expanded(
                                              child: Padding(
                                                padding: getPadding(
                                                  top: 9,
                                                ),
                                                child: Text(
                                                  widget.jobDetails['salary'],
                                                  style: CustomTextStyles
                                                      .titleSmallPrimarySemiBold,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            CustomIconButton(
                                              height: getSize(48),
                                              width: getSize(48),
                                              padding: getPadding(
                                                all: 12,
                                              ),
                                              decoration: IconButtonStyleHelper
                                                  .fillTealA,
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
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            CustomIconButton(
                                              height: getSize(48),
                                              width: getSize(48),
                                              padding: getPadding(
                                                all: 12,
                                              ),
                                              decoration: IconButtonStyleHelper
                                                  .fillTealA,
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
                                                    .labelLargeBluegray300,
                                              ),
                                            ),
                                            Expanded(
                                                child: Padding(
                                              padding: getPadding(
                                                top: 9,
                                              ),
                                              child: Text(
                                                widget.jobDetails[
                                                    'workExperience'],
                                                style: CustomTextStyles
                                                    .titleSmallPrimarySemiBold,
                                              ),
                                            ))
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
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
                                                            "Thông tin công việc",
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
                                alignment: Alignment.topRight,
                                child: Padding(
                                    padding: getPadding(
                                        left: 24, top: 16, right: 24),
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: widget
                                          .jobDetails['jobApplicationEntities']
                                          .length,
                                      itemBuilder: (context, index) {
                                        var jobData = widget.jobDetails[
                                            'jobApplicationEntities'];
                                        jobData.sort((a, b) => (a['status'] as int).compareTo(b['status'] as int));
                                        return GestureDetector(
                                          onTap: () {},
                                          child: Column(
                                            children: [
                                              Align(
                                                alignment: Alignment.center,
                                                child: Container(
                                                  padding: getPadding(all: 16),
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
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  getPadding(
                                                                top: 4,
                                                                bottom: 10,
                                                              ),
                                                              child: GestureDetector(
                                                                onTap: () {
                                                                  var data = jobData[index]['content'];

                                                                  Navigator
                                                                      .push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                      builder: (context) =>
                                                                          ReadCV(data: data),
                                                                    ),
                                                                  );
                                                                },
                                                                child:
                                                                Padding(
                                                                  padding:
                                                                  getPadding(
                                                                      top: 5),
                                                                  child:
                                                                  Text(
                                                                    jobData[index]['name'] ??
                                                                        '',
                                                                    style: CustomTextStyles
                                                                        .titleSmallBluegray300
                                                                        .copyWith(
                                                                      color: appTheme.black900,
                                                                    ),
                                                                    maxLines:
                                                                    2,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          CustomElevatedButton(
                                                            height:
                                                            getVerticalSize(
                                                                28),
                                                            width:
                                                            getVerticalSize(
                                                                100),
                                                            text: jobData[index]['status']==1?'Chưa xem' : 'Đã xem',
                                                            buttonTextStyle:
                                                            theme
                                                                .textTheme
                                                                .labelLarge!,
                                                            buttonStyle: _color(jobData[index]['status']),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          CustomElevatedButton(
                                                            height:
                                                            getVerticalSize(
                                                                28),
                                                            width:
                                                            getVerticalSize(
                                                                200),
                                                            text: 'Duyệt CV',
                                                            buttonTextStyle:
                                                            theme
                                                                .textTheme
                                                                .labelLarge!.copyWith(
                                                                color: Colors.white
                                                            ),
                                                            buttonStyle: CustomButtonStyles
                                                                .fillRedTL4,
                                                          ),
                                                        ],
                                                      )
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

  onTapArrowbackone(BuildContext context) {
    Navigator.pop(context);
  }
  _color (int? status){
    switch (status) {
      case 1:
        return CustomButtonStyles
            .fillBlueGray;
      case 2:
        return CustomButtonStyles
            .fillBlueGray;
      case 3:
        return CustomButtonStyles
            .yellow;
      default:
        return 'Khác';
    }
  }
  _getStatusText(int? status) {
    switch (status) {
      case 1:
        return 'Chưa xem';
      case 2:
        return 'Đã xem';
      case 3:
        return '';
      default:
        return 'Khác';
    }
  }
}
