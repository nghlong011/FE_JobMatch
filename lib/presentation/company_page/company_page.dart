import '../../widgets/app_bar/appbar_image_1.dart';
import '../../widgets/app_bar/appbar_title.dart';
import 'package:flutter/material.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/custom_app_bar.dart';
import 'package:nghlong011_s_application5/widgets/custom_icon_button.dart';

import '../../widgets/custom_search_view.dart';
import '../company_detail/company_detail.dart';
import '../home_page/home_page_provider.dart';

class CompanyPage extends StatefulWidget {
  const CompanyPage({Key? key}) : super(key: key);

  @override
  _CompanyPageState createState() => _CompanyPageState();
}

// ignore_for_file: must_be_immutable
class _CompanyPageState extends State<CompanyPage> {
  TextEditingController searchController = TextEditingController();
  var _jobData;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      String? token = await getToken();
      var dataJobProvider = Provider.of<GetJobProvider>(context, listen: false);
      dataJobProvider.getJob(token!);
      setState(() {
        _jobData = dataJobProvider.responseData;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    var getJobProvider = Provider.of<GetJobProvider>(context, listen: true);
    var jobData = getJobProvider.responseData;
    List<dynamic> allJobs = [];
    if (jobData != null) {
      for (var company in jobData) {
        var jobsEntity = company['jobs'];
        if (jobsEntity != null) {
          for (var job in jobsEntity) {
            allJobs.add(job);
          }
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
                    margin: getMargin(left: 24, top: 13, bottom: 13),
                    onTap: () {
                      onTapArrowbackone(context);
                    }),
                centerTitle: true,
                title: AppbarTitle(text: "Công ty")),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomSearchView(
                          onFieldSubmitted: (value) async {
                            List<dynamic> searchResults = jobData
                                .where((company) =>
                            company['companyName'] != null &&
                                company['companyName'].toString().toLowerCase().trim().contains(value.toLowerCase().trim()))
                                .toList();
                            print(value);
                            print("Dữ liệu trước khi tìm kiếm: $jobData");
                            print("Dữ liệu sau khi tìm kiếm: $searchResults");
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
                              BoxConstraints(maxHeight: getVerticalSize(52))),
                      Padding(
                          padding: getPadding(left: 24, top: 22),
                          child: Text("Danh sách công ty",
                              style: CustomTextStyles.titleMediumInter)),
                      Expanded(
                          child: Align(
                              alignment: Alignment.center,
                              child: Padding(
                                  padding:
                                      getPadding(left: 24, top: 16, right: 24),
                                  child: _jobData != null ?
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: _jobData.length,
                                    itemBuilder: (context, index) {
                                      List<String> locations =
                                          (_jobData[index]['location'] ?? '')
                                              .split('/');
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  CompanyDetailsScreen(
                                                      jobDetails:
                                                          jobData[index]),
                                            ),
                                          );
                                        },
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
                                                              all: 8),
                                                          child: Image.network(
                                                            _jobData[index]
                                                                    ['logo'] ??
                                                                '',
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
                                                                GestureDetector(
                                                                  onTap: () {},
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        getPadding(
                                                                            top:
                                                                                5),
                                                                    child: Text(
                                                                      _jobData[index]
                                                                              [
                                                                              'companyName'] ??
                                                                          '',
                                                                      style: CustomTextStyles
                                                                          .labelLargeBluegray300SemiBold,
                                                                      maxLines:
                                                                          2,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      getPadding(
                                                                    top: 9,
                                                                  ),
                                                                  child: Text(
                                                                    locations[
                                                                        0],
                                                                    style: CustomTextStyles
                                                                        .labelLargeGray600_1,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        CustomImageView(
                                                          svgPath: ImageConstant
                                                              .imgBookmark,
                                                          height: getSize(24),
                                                          width: getSize(24),
                                                          margin: getMargin(
                                                              bottom: 25),
                                                        ),
                                                      ],
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
                                  )
                                : CircularProgressIndicator(),
                              )
                          ))
                    ]))));
  }

  onTapArrowbackone(BuildContext context) {
    Navigator.pop(context);
  }
}
