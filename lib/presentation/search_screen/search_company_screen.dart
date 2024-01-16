import 'package:nghlong011_s_application5/presentation/search_screen/SearchProvider.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_icon_button.dart';
import '../job_details_tab_container_screen/job_details_tab_container_screen.dart';
import 'package:flutter/material.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/appbar_image_1.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/appbar_title.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/custom_app_bar.dart';
import 'package:nghlong011_s_application5/widgets/custom_search_view.dart';

// ignore_for_file: must_be_immutable
class SearchCompanyScreen extends StatefulWidget {
  var jobData;
  SearchCompanyScreen({
    Key? key,
    required this.jobData,
  }) : super(key: key);

  @override
  _SearchCompanyScreenState createState() => _SearchCompanyScreenState();
}

class _SearchCompanyScreenState extends State<SearchCompanyScreen> {
  TextEditingController searchController = TextEditingController();
  var _jobData;

  @override
  void initState() {
    super.initState();
    _jobData = widget.jobData;
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    var data = widget.jobData;
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.whiteA70001,
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
                leadingWidth: getHorizontalSize(48),
                leading: AppbarImage1(
                    svgPath: ImageConstant.imgGroup162799,
                    margin: getMargin(left: 24, top: 13, bottom: 13),
                    onTap: () {
                      onTapArrowbackone(context);
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "Tìm Công ty")),
            body: Container(
                width: double.maxFinite,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Consumer<SearchProvider>(
                          builder: (context, searchProvider, _) {
                        return CustomSearchView(
                            onFieldSubmitted: (value) async {
                              List<dynamic> searchResults = data
                                  .where((company) =>
                                      company['jobs'] != null &&
                                      company['jobs'].any((job) =>
                                          job['title'] != null &&
                                          job['title']
                                              .toString()
                                              .toLowerCase()
                                              .contains(value.toLowerCase())))
                                  .toList();
                              setState(() {
                                _jobData = searchResults;
                              });
                              // }
                            },
                            margin: getMargin(top: 30),
                            controller: searchController,
                            hintText: "Search...",
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
                                BoxConstraints(maxHeight: getVerticalSize(52)));
                      }),
                      Expanded(
                          child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                  padding:
                                      getPadding(left: 24, top: 16, right: 24),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: _jobData.length,
                                    itemBuilder: (context, index) {
                                      var company = _jobData[index];
                                      var companyName = company['companyName'];
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
                                            itemBuilder: (context, jobIndex) {
                                              var job = jobs[jobIndex];
                                              var jobTitle = job['title'];
                                              var jobSalary = job['salary'];
                                              var jobLocation = job['location'];

                                              return GestureDetector(
                                                onTap: () {
                                                  Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          JobDetailsTabContainerScreen(
                                                              jobDetails: job,
                                                              company: company),
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
                                                              MainAxisSize.min,
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
                                                                          all:
                                                                              8),
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
                                                                  height:
                                                                      getSize(
                                                                          24),
                                                                  width:
                                                                      getSize(
                                                                          24),
                                                                  margin:
                                                                      getMargin(
                                                                    bottom: 25,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Padding(
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
                                                                          getVerticalSize(
                                                                              28),
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
                                                        height: getVerticalSize(
                                                            16)),
                                                  ],
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  ))))
                    ]))));
  }

  onTapArrowbackone(BuildContext context) {
    Navigator.pop(context);
  }

  onTapView(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.jobDetailsTabContainerScreen);
  }
}
