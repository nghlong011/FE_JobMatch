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
class SearchScreen extends StatefulWidget {
  final List<dynamic> allJobs;
  SearchScreen({Key? key, required this.allJobs,}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}
class _SearchScreenState extends State<SearchScreen> {

  TextEditingController searchController = TextEditingController();
  late List<dynamic> _listJobs;

  @override
  void initState() {
    super.initState();
    _listJobs = widget.allJobs;
  }


  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
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
                title: AppbarTitle(text: "Tìm Việc")),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 24, right: 24),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Consumer<SearchProvider>(builder: (context, searchProvider,_){
                        return CustomSearchView(
                            onFieldSubmitted: (value) async {
                              if (!searchProvider.isLoading) {
                                String? title = value;
                                var getJobProvider = Provider.of<SearchProvider>(context, listen: false);
                                await getJobProvider.searchTitle(title, context);
                                setState(() {
                                  _listJobs = getJobProvider.responseData;
                                });
                                print(_listJobs);
                              }
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
                            BoxConstraints(maxHeight: getVerticalSize(52))
                        );

                      }),
                      Expanded(
                          child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                  padding:
                                  getPadding(left: 24, top: 16, right: 24),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: _listJobs.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  JobDetailsTabContainerScreen(
                                                      jobDetails:
                                                      _listJobs[index]),
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
                                                  CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        CustomIconButton(
                                                          height: getSize(48),
                                                          width: getSize(48),
                                                          padding: getPadding(
                                                            all: 8,
                                                          ),
                                                          child:
                                                          CustomImageView(
                                                            svgPath: ImageConstant
                                                                .imgGroupPrimary,
                                                          ),
                                                        ),
                                                        Padding(
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
                                                              GestureDetector(
                                                                onTap: () {},
                                                                child: Padding(
                                                                  padding:
                                                                  getPadding(
                                                                    top: 5,
                                                                  ),
                                                                  child: Text(
                                                                    _listJobs[index]
                                                                    [
                                                                    'title'] ??
                                                                        '',
                                                                    style: CustomTextStyles
                                                                        .labelLargeBluegray300SemiBold,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Spacer(),
                                                        CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgBookmark,
                                                          height: getSize(24),
                                                          width: getSize(24),
                                                          margin: getMargin(
                                                            bottom: 25,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding: getPadding(
                                                        left: 60,
                                                        top: 9,
                                                      ),
                                                      child: Text(
                                                        _listJobs[index]
                                                        ['salary'] ??
                                                            '',
                                                        style: CustomTextStyles
                                                            .labelLargeGray600_1,
                                                      ),
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
                                                            CustomElevatedButton(
                                                              height:
                                                              getVerticalSize(
                                                                  28),
                                                              width:
                                                              getHorizontalSize(
                                                                  70),
                                                              text: "PHP",
                                                              buttonTextStyle:
                                                              theme
                                                                  .textTheme
                                                                  .labelLarge!,
                                                            ),
                                                            CustomElevatedButton(
                                                              height:
                                                              getVerticalSize(
                                                                  28),
                                                              width:
                                                              getHorizontalSize(
                                                                  103),
                                                              text: "JavaScrip",
                                                              margin: getMargin(
                                                                left: 8,
                                                              ),
                                                              buttonTextStyle:
                                                              theme
                                                                  .textTheme
                                                                  .labelLarge!,
                                                            ),
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
                    ]))));
  }

  onTapArrowbackone(BuildContext context) {
    Navigator.pop(context);
  }

  onTapView(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.jobDetailsTabContainerScreen);
  }
}
