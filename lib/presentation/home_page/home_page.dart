import 'package:nghlong011_s_application5/presentation/job_details_tab_container_screen/job_details_tab_container_screen.dart';

import '../../widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/appbar_image.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/appbar_subtitle.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/appbar_subtitle_2.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/custom_app_bar.dart';
import 'package:nghlong011_s_application5/widgets/custom_icon_button.dart';

import '../../widgets/custom_search_view.dart';
import '../company_page/company_page.dart';
import '../profile_page/profile_provider.dart';
import '../search_screen/search_screen.dart';
import 'home_page_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

// ignore_for_file: must_be_immutable
class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      String? token = await getToken();
      var dataJobProvider = Provider.of<GetJobProvider>(context, listen: false);
      dataJobProvider.getJob(token!);
      final userData = {
        'email': 'admin',
      };
      var dataProvider = Provider.of<ProfileProvider>(context, listen: false);
      dataProvider.getProfile(userData, token);
    });
  }

  @override
  Widget build(BuildContext context) {
    var getJobProvider = Provider.of<GetJobProvider>(context, listen: true);
    var jobData = getJobProvider.responseData;
    var getProfileProvider =
        Provider.of<ProfileProvider>(context, listen: true);
    var dataProfile = getProfileProvider.responseData;
    List<dynamic> allJobs = [];
    if (jobData != null) {
      for (var company in jobData) {
        var jobsEntity = company['jobs'];
        if (jobsEntity != null) {
          allJobs.addAll(jobsEntity);
        }
      }
    } else {
      // Xử lý khi jobData là null
    }
    String avatarUrl = dataProfile?['avatar'] ?? '';
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.whiteA70001,
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
                leadingWidth: getHorizontalSize(74),
                leading: CustomImageView(
                    url: avatarUrl,
                    height: getSize(89),
                    width: getSize(89),
                    radius: BorderRadius.circular(getHorizontalSize(44))),
                title: Padding(
                    padding: getPadding(left: 10),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppbarSubtitle(text: "Chào mừng trở lại! 👋"),
                          AppbarSubtitle2(
                            text: "Tìm kiếm công việc mơ ước",
                          )
                        ])),
                actions: [
                  AppbarImage(
                      svgPath: ImageConstant.imgNotification,
                      margin:
                          getMargin(left: 24, top: 13, right: 24, bottom: 13))
                ]),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomSearchView(
                          margin: getMargin(top: 10, left: 25, right: 25),
                          controller: searchController,
                          hintText: "Tìm kiếm .....",
                          hintStyle: CustomTextStyles.titleMediumBluegray400,
                          prefix: Container(
                              margin: getMargin(
                                  left: 16, top: 17, right: 8, bottom: 17),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgSearch)),
                          prefixConstraints:
                          BoxConstraints(maxHeight: getVerticalSize(52)),
                          suffix: Container(
                              margin: getMargin(
                                  left: 30, top: 17, right: 16, bottom: 17),
                              child: CustomImageView(
                                  svgPath: ImageConstant.imgFilterPrimary)),
                          suffixConstraints:
                          BoxConstraints(maxHeight: getVerticalSize(52)),
                          contentPadding: getPadding(top: 12, bottom: 12)),
                      Padding(
                        padding: getPadding(top: 25),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Column(
                                children: [
                                  CustomImageView(
                                    height: getVerticalSize(28),
                                    width: getHorizontalSize(28),
                                    imagePath: ImageConstant.imgJob,
                                    onTap: () {
                                      print('click');
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              SearchScreen(jobData: jobData),
                                        ),
                                      );
                                    },
                                  ),
                                  Text('Gợi ý')
                                ],
                              ),
                            ),
                            Container(
                              margin: getMargin(left: 25,right: 25),
                              child: Column(
                                children: [
                                  CustomImageView(
                                    height: getVerticalSize(28),
                                    width: getHorizontalSize(28),
                                    imagePath: ImageConstant.imgCom,
                                    onTap: () {
                                      print('click');
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              CompanyPage(),
                                        ),
                                      );
                                    },
                                  ),
                                  Text('Công ty')
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  CustomImageView(
                                    height: getVerticalSize(28),
                                    width: getHorizontalSize(28),
                                    imagePath: ImageConstant.imgJobCate,
                                    onTap: () {
                                      print('click');
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              CompanyPage(),
                                        ),
                                      );
                                    },
                                  ),
                                  Text('Thể loại')
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding: getPadding(left: 25, top: 25),
                          child: Text("Việc làm phù hợp",
                              style: CustomTextStyles.titleMedium18)),
                      Align(
                          alignment: Alignment.centerRight,
                          child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              padding: getPadding(left: 24, top: 17),
                              child: IntrinsicWidth(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                    Expanded(
                                        child: Container(
                                            padding: getPadding(all: 16),
                                            decoration: AppDecoration
                                                .fillPrimary
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder16),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CustomIconButton(
                                                      height: getSize(48),
                                                      width: getSize(48),
                                                      margin:
                                                          getMargin(bottom: 96),
                                                      padding:
                                                          getPadding(all: 8),
                                                      decoration:
                                                          IconButtonStyleHelper
                                                              .fillOnPrimaryContainer,
                                                      child: CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgFrame162722)),
                                                  Padding(
                                                      padding: getPadding(
                                                          left: 12, top: 4),
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                                "Lập Trình Web .NET",
                                                                style: CustomTextStyles
                                                                    .titleSmallGray5001Bold),
                                                            Opacity(
                                                                opacity: 0.8,
                                                                child: Padding(
                                                                    padding:
                                                                        getPadding(
                                                                            top:
                                                                                7),
                                                                    child: Text(
                                                                        "Công ty CTC",
                                                                        maxLines:
                                                                            2,
                                                                        style: CustomTextStyles
                                                                            .labelLargeGray5001SemiBold))),
                                                            Opacity(
                                                                opacity: 0.64,
                                                                child: Padding(
                                                                    padding:
                                                                        getPadding(
                                                                            top:
                                                                                11),
                                                                    child: Text(
                                                                        "Hồ Chí Minh",
                                                                        style: CustomTextStyles
                                                                            .labelLargeGray5001_2))),
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        top: 9),
                                                                child: Text(
                                                                    "11.000 - 12.000 USD",
                                                                    style: CustomTextStyles
                                                                        .labelLargeGray5001_1)),
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        top:
                                                                            17),
                                                                child: Row(
                                                                    children: [
                                                                      Container(
                                                                          margin: getMargin(
                                                                              left:
                                                                                  7),
                                                                          padding: getPadding(
                                                                              left:
                                                                                  12,
                                                                              top:
                                                                                  4,
                                                                              right:
                                                                                  12,
                                                                              bottom:
                                                                                  4),
                                                                          decoration: AppDecoration.fillOnPrimaryContainer1.copyWith(
                                                                              borderRadius: BorderRadiusStyle
                                                                                  .roundedBorder16),
                                                                          child: Text(
                                                                              "Two days ago",
                                                                              style: CustomTextStyles.labelLargeGray5001))
                                                                    ]))
                                                          ]))
                                                ]))),
                                    Expanded(
                                        child: Container(
                                            margin: getMargin(left: 16),
                                            padding: getPadding(all: 16),
                                            decoration: AppDecoration
                                                .fillDeepPurple
                                                .copyWith(
                                                    borderRadius:
                                                        BorderRadiusStyle
                                                            .roundedBorder16),
                                            child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CustomIconButton(
                                                      height: getSize(48),
                                                      width: getSize(48),
                                                      margin:
                                                          getMargin(bottom: 96),
                                                      padding:
                                                          getPadding(all: 8),
                                                      decoration:
                                                          IconButtonStyleHelper
                                                              .fillOnPrimaryContainer,
                                                      child: CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgFrame162722)),
                                                  Padding(
                                                      padding:
                                                          getPadding(left: 12),
                                                      child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                                "Senior UI/UX Designer",
                                                                style: CustomTextStyles
                                                                    .titleSmallGray5001Bold),
                                                            Opacity(
                                                                opacity: 0.8,
                                                                child: Padding(
                                                                    padding:
                                                                        getPadding(
                                                                            top:
                                                                                4),
                                                                    child: Text(
                                                                        "Shopee",
                                                                        style: CustomTextStyles
                                                                            .labelLargeGray5001SemiBold))),
                                                            Opacity(
                                                                opacity: 0.64,
                                                                child: Container(
                                                                    width:
                                                                        getHorizontalSize(
                                                                            181),
                                                                    margin:
                                                                        getMargin(
                                                                            top:
                                                                                8),
                                                                    child: Text(
                                                                        "Jakarta, Indonesia (Remote)",
                                                                        maxLines:
                                                                            null,
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        style: CustomTextStyles
                                                                            .labelLargeGray5001_2
                                                                            .copyWith(height: 1.67)))),
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        top: 4),
                                                                child: Text(
                                                                    "1100 - 12.000/Month",
                                                                    style: CustomTextStyles
                                                                        .labelLargeGray5001_1)),
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        top:
                                                                            16),
                                                                child: Row(
                                                                    children: [
                                                                      Container(
                                                                          padding: getPadding(
                                                                              left:
                                                                                  12,
                                                                              top:
                                                                                  4,
                                                                              right:
                                                                                  12,
                                                                              bottom:
                                                                                  4),
                                                                          decoration: AppDecoration.fillOnPrimaryContainer1.copyWith(
                                                                              borderRadius: BorderRadiusStyle
                                                                                  .roundedBorder16),
                                                                          child: Text(
                                                                              "Fulltime",
                                                                              style: CustomTextStyles.labelLargeGray5001)),
                                                                      Container(
                                                                          margin: getMargin(
                                                                              left:
                                                                                  7),
                                                                          padding: getPadding(
                                                                              left:
                                                                                  12,
                                                                              top:
                                                                                  4,
                                                                              right:
                                                                                  12,
                                                                              bottom:
                                                                                  4),
                                                                          decoration: AppDecoration.fillOnPrimaryContainer1.copyWith(
                                                                              borderRadius: BorderRadiusStyle
                                                                                  .roundedBorder16),
                                                                          child: Text(
                                                                              "Two days ago",
                                                                              style: CustomTextStyles.labelLargeGray5001))
                                                                    ]))
                                                          ]))
                                                ])))
                                  ])))),
                      Padding(
                          padding: getPadding(left: 24, top: 22),
                          child: Text("Việc làm mới",
                              style: CustomTextStyles.titleMediumInter)),
                      Expanded(
                          child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding:
                                    getPadding(left: 24, top: 16, right: 24),
                                child: jobData != null
                                    ? ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: jobData.length,
                                        itemBuilder: (context, index) {
                                          var company = jobData[index];
                                          var companyName =
                                              company['companyName'];
                                          var logo = company['logo'];
                                          var jobs =
                                              company['jobs'] as List<dynamic>;
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ListView.builder(
                                                shrinkWrap: true,
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                itemCount: jobs.length,
                                                itemBuilder:
                                                    (context, jobIndex) {
                                                  var job = jobs[jobIndex];
                                                  var jobTitle = job['title'];
                                                  var jobSalary = job['salary'];
                                                  var jobLocation =
                                                      job['location'];

                                                  return GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              JobDetailsTabContainerScreen(
                                                                  jobDetails:
                                                                      job,
                                                                  company:
                                                                      company),
                                                        ),
                                                      );
                                                    },
                                                    child: Column(
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Container(
                                                            padding: getPadding(
                                                              all: 16,
                                                            ),
                                                            decoration:
                                                                AppDecoration
                                                                    .outlineIndigo
                                                                    .copyWith(
                                                              borderRadius:
                                                                  BorderRadiusStyle
                                                                      .roundedBorder16,
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    CustomIconButton(
                                                                      height:
                                                                          getSize(
                                                                              48),
                                                                      width:
                                                                          getSize(
                                                                              48),
                                                                      padding:
                                                                          getPadding(
                                                                              all: 8),
                                                                      child: Image
                                                                          .network(
                                                                        logo,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                        child:
                                                                            Padding(
                                                                      padding:
                                                                          getPadding(
                                                                        left:
                                                                            12,
                                                                        top: 4,
                                                                        bottom:
                                                                            2,
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            jobTitle,
                                                                            style:
                                                                                CustomTextStyles.labelLargeBlack900SemiBold,
                                                                          ),
                                                                          Text(
                                                                            companyName,
                                                                            style:
                                                                                CustomTextStyles.labelLargeBluegray300SemiBold,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    )),
                                                                    CustomImageView(
                                                                      svgPath:
                                                                          ImageConstant
                                                                              .imgBookmark,
                                                                      height:
                                                                          getSize(
                                                                              24),
                                                                      width:
                                                                          getSize(
                                                                              24),
                                                                      margin:
                                                                          getMargin(
                                                                        bottom:
                                                                            25,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        getPadding(
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
                                                                              getVerticalSize(28),
                                                                          text:
                                                                              jobSalary,
                                                                          buttonTextStyle: theme
                                                                              .textTheme
                                                                              .labelLarge!,
                                                                        )),
                                                                        Expanded(
                                                                            child:
                                                                                CustomElevatedButton(
                                                                          height:
                                                                              getVerticalSize(28),
                                                                          text:
                                                                              jobLocation,
                                                                          margin:
                                                                              getMargin(
                                                                            left:
                                                                                8,
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
                                                            height:
                                                                getVerticalSize(
                                                                    16)),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      )
                                    : CircularProgressIndicator(),
                              )))
                    ]))));
  }
}
