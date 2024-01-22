import 'dart:collection';

import 'package:nghlong011_s_application5/presentation/saved_page/saved_page_provider.dart';

import '../../widgets/app_bar/appbar_title.dart';
import 'package:flutter/material.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/custom_app_bar.dart';
import 'package:nghlong011_s_application5/widgets/custom_icon_button.dart';

import '../../widgets/custom_elevated_button.dart';
import '../home_page/home_page_provider.dart';
import '../job_details_tab_container_screen/job_details_tab_container_screen.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({Key? key}) : super(key: key);

  @override
  _SavedPageState createState() => _SavedPageState();
}

// ignore_for_file: must_be_immutable
class _SavedPageState extends State<SavedPage> {
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      String? token = await getToken();
      var dataJobProvider = Provider.of<GetJobProvider>(context, listen: false);
      var dataJobAppProvider = Provider.of<GetJobAppProvider>(context, listen: false);
      dataJobProvider.getJob(token!);
      dataJobAppProvider.getJobApp(token);

    });
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    var getJobProvider = Provider.of<GetJobProvider>(context, listen: true);
    var getJobAppProvider = Provider.of<GetJobAppProvider>(context, listen: true);
    var jobDataSave = getJobProvider.responseData;
    var data1 = getJobAppProvider.responseData;
    List<Map<String, dynamic>> jobDataCopy = [];
    if(jobDataSave != null && jobDataSave != []){
      jobDataCopy = List.from(jobDataSave);
    };
    List<Map<String, dynamic>> filteredJobs = [];
    if (data1 != null) {
      List<int> jobIdsToSearch = data1.map<int>((job) => job['jobId'] as int).toList();

      jobDataCopy.forEach((company) {
        List<Map<String, dynamic>> originalJobs = List<Map<String, dynamic>>.from(company['jobs'] ?? []);

        List<Map<String, dynamic>> companyFilteredJobs = originalJobs
            .where((job) => jobIdsToSearch.contains(job['jobId']))
            .toList();

        if (companyFilteredJobs.isNotEmpty) {
          Map<String, dynamic> companyCopy = Map<String, dynamic>.from(company);
          companyCopy['jobs'] = UnmodifiableListView<Map<String, dynamic>>(companyFilteredJobs);
          filteredJobs.add(companyCopy);
        }
      });

    }
    filteredJobs = List.from(filteredJobs);



    List<dynamic> allJobs = [];
    if (jobDataSave != null) {
      for (var company in jobDataSave) {
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
                centerTitle: true,
                title: AppbarTitle(text: "Danh sách công việc đã ứng tuyển")),
            body: SizedBox(
                width: double.maxFinite,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Align(
                              child: Padding(
                                padding:
                                getPadding(left: 24, top: 16, right: 24),
                                child: jobDataSave != null ?
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: filteredJobs.length,
                                  itemBuilder: (context, index) {
                                    var company = filteredJobs[index];
                                    var companyName =
                                    company['companyName'];
                                    var logo = company['logo'];
                                    var jobs =
                                    company['jobs'] as List<dynamic>;
                                    return Column(
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
                                                Navigator.pushReplacement(
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
                                                                          maxLines: 2,
                                                                          overflow: TextOverflow.ellipsis,
                                                                          style:
                                                                          CustomTextStyles.labelLargeBlack900SemiBold,
                                                                        ),
                                                                        Text(
                                                                          companyName,
                                                                          maxLines: 2,
                                                                          overflow: TextOverflow.ellipsis,
                                                                          style:
                                                                          CustomTextStyles.labelLargeBluegray300SemiBold,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  )),
                                                              CustomElevatedButton(
                                                                height:
                                                                getVerticalSize(28),
                                                                width: getVerticalSize(80),
                                                                text: 'Đang xét duyệt',
                                                                buttonTextStyle: theme
                                                                    .textTheme
                                                                    .labelMedium!,
                                                              )
                                                            ],
                                                          ),
                                                          Align(
                                                            child:
                                                            Padding(
                                                              padding:
                                                              getPadding(
                                                                top: 13,
                                                              ),
                                                              child: Row(
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
                                                                            .labelLarge!.copyWith(
                                                                          color: Color(0XFF0E0E0E),
                                                                        ),
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
                                                                            .labelLarge!.copyWith(
                                                                          color: Color(0XFF0E0E0E),)
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
                              )
                          ))
                    ]))));
  }
}
