import 'package:flutter/material.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/appbar_image.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/appbar_subtitle.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/custom_app_bar.dart';
import 'package:nghlong011_s_application5/widgets/custom_elevated_button.dart';
import '../apply_job_popup_dialog/accept_dialog.dart';
import '../post_job_detail/post_job_detail.dart';
import 'get_job.dart';

class HomePageEmployer extends StatefulWidget {
  const HomePageEmployer({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

// ignore_for_file: must_be_immutable
class _HomePageState extends State<HomePageEmployer> {
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      String? token = await getToken();
      var dataJobProvider =
          Provider.of<GetJobEmployerProvider>(context, listen: false);
      dataJobProvider.getJobEmployer(token!);
    });
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    var getJobProvider =
        Provider.of<GetJobEmployerProvider>(context, listen: true);
    var jobData = getJobProvider.responseData;
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.whiteA70001,
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
                leadingWidth: getHorizontalSize(74),
                title: Padding(
                    padding: getPadding(left: 10),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AppbarSubtitle(text: "Chào mừng trở lại! 👋"),
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
                      Padding(
                          padding: getPadding(left: 24, top: 22),
                          child: Text("Danh sách tin tuyển dụng",
                              style: CustomTextStyles.titleMediumInter)),
                      Expanded(
                          child: Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding:
                                    getPadding(left: 24, top: 16, right: 24),
                                child: jobData != null
                                    ? ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: jobData.length,
                                        itemBuilder: (context, index) {
                                          var list = jobData[index]
                                              ['jobApplicationEntities'];
                                          List<dynamic> statusOneApplications = list.where((jobApp) => jobApp['status'] == 1).toList();

                                          // Đếm số lượng phần tử có status == 1
                                          int countStatusOne = statusOneApplications.length;

                                          print("Số lượng job applications có status == 1 là: $countStatusOne");
                                          var job = jobData[index];
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        PostJobDetailsTabContainerScreen(
                                                      jobDetails: job,
                                                    ),
                                                  ));
                                            },
                                            child: Column(
                                              children: [
                                                Align(
                                                  alignment: Alignment.center,
                                                  child: Container(
                                                    padding:
                                                        getPadding(all: 16),
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
                                                          MainAxisAlignment
                                                              .start,
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
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    GestureDetector(
                                                                      onTap:
                                                                          () {},
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            getPadding(top: 5),
                                                                        child:
                                                                            Text(
                                                                          jobData[index]['title'] ??
                                                                              '',
                                                                          style: CustomTextStyles
                                                                              .titleSmallBluegray300
                                                                              .copyWith(
                                                                            color:
                                                                                Color(0XFF000000),
                                                                          ),
                                                                          maxLines:
                                                                              2,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
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
                                                              text: _getStatusText(jobData[index]['status']),
                                                              buttonTextStyle:
                                                              TextStyle(
                                                                color: Color(0XFFffffff),
                                                                fontSize: getFontSize(
                                                                  12,
                                                                ),
                                                                fontWeight: FontWeight.bold,
                                                              ),
                                                              buttonStyle: _color(jobData[index]['status']),
                                                            ),
                                                          ],
                                                        ),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                      'Mã tin tuyển dụng',
                                                                      style: CustomTextStyles
                                                                          .labelLargeBluegray300SemiBold),
                                                                  Text(
                                                                      jobData[index]
                                                                              [
                                                                              'jobId']
                                                                          .toString(),
                                                                      style: CustomTextStyles
                                                                          .labelLargeBluegray300SemiBold)
                                                                ],
                                                              ),
                                                            ),
                                                            Expanded(
                                                                child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'CV ứng tuyển',
                                                                  style: CustomTextStyles
                                                                      .labelLargeBluegray300SemiBold,
                                                                ),
                                                                Text(
                                                                  list.length
                                                                      .toString(),
                                                                  style: CustomTextStyles
                                                                      .labelLargeBluegray300SemiBold,
                                                                )
                                                              ],
                                                            ))
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding: getPadding(
                                                            top: 10,
                                                            bottom: 10,
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Expanded(
                                                                  child:
                                                                      CustomElevatedButton(
                                                                onTap:
                                                                    () async {
                                                                  var data = jobData[
                                                                              index]
                                                                          [
                                                                          'jobId']
                                                                      .toString();
                                                                  onTapContinue(
                                                                      context,
                                                                      data);
                                                                },
                                                                height:
                                                                    getVerticalSize(
                                                                        28),
                                                                text: 'Xoá Tin',
                                                                margin:
                                                                    getMargin(
                                                                  left: 8,
                                                                ),
                                                                buttonStyle:
                                                                    CustomButtonStyles
                                                                        .fillRedTL4,
                                                                buttonTextStyle: theme
                                                                    .textTheme
                                                                    .labelMedium!
                                                                    .copyWith(
                                                                  color: Color(
                                                                      0XFFffffff),
                                                                ),
                                                              ))
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                    height:
                                                        getVerticalSize(16)),
                                              ],
                                            ),
                                          );
                                        },
                                      )
                                    : CircularProgressIndicator(),
                              )))
                    ]))));
  }
  _color (int? status){
    switch (status) {
      case 1:
        return CustomButtonStyles
            .green;
      case 2:
        return CustomButtonStyles
            .fillRedTL4;
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
        return 'Đang bật';
      case 2:
        return 'Đang tắt';
      case 3:
        return 'Đang xét duyệt';
      default:
        return 'Khác';
    }
  }
  onTapContinue(BuildContext context, var data) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: AcceptPopupDialog(data: data),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }
}




