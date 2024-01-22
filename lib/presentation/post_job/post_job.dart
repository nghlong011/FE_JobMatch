import 'dart:io';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';
import 'package:nghlong011_s_application5/presentation/post_job/post_job_provider.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/appbar_image_1.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/appbar_title.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/custom_app_bar.dart';
import 'package:nghlong011_s_application5/widgets/custom_elevated_button.dart';
import 'package:nghlong011_s_application5/widgets/custom_text_form_field.dart';
import 'package:path_provider/path_provider.dart';

import '../profile_page/profile_provider.dart';

// ignore_for_file: must_be_immutable
class PostJobScreen extends StatefulWidget {
  PostJobScreen({Key? key}) : super(key: key);

  @override
  _PostJobScreen createState() => _PostJobScreen();
}

class _PostJobScreen extends State<PostJobScreen> {
  TextEditingController titleController = TextEditingController();

  TextEditingController numberController = TextEditingController();

  TextEditingController salaryController = TextEditingController();

  TextEditingController locationController = TextEditingController();

  TextEditingController workExperienceController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      String? token = await getToken();
      final userData = {
        'email': 'admin',
      };
      var dataJobProvider =
      Provider.of<ProfileProvider>(context, listen: false);
      dataJobProvider.getProfile(userData, token!);
    });
  }
  String selectedDate = '';
  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
          backgroundColor: appTheme.whiteA70001,
          resizeToAvoidBottomInset: true,
          appBar: CustomAppBar(
              leadingWidth: getHorizontalSize(48),
              leading: AppbarImage1(
                  svgPath: ImageConstant.imgGroup162799,
                  margin: getMargin(left: 24, top: 13, bottom: 13),
                  onTap: () {
                    onTapArrowbackone(context);
                  }),
              centerTitle: true,
              title: AppbarTitle(text: "Đăng tin"),
              actions: [

              ]),
          body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                  padding: getPadding(top: 32),
                  child: Padding(
                      padding: getPadding(left: 24, right: 24, bottom: 5),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Tiêu đề công việc",
                                style: CustomTextStyles.titleSmallPrimary),
                            CustomTextFormField(
                                controller: titleController,
                                margin: getMargin(top: 9),
                                hintText: '',
                                hintStyle:
                                CustomTextStyles.titleMediumBluegray400),

                            Text("Số lượng tuyển",
                                style: CustomTextStyles.titleSmallPrimary),
                            CustomTextFormField(
                                controller: numberController,
                                margin: getMargin(top: 9),
                                hintText: '',
                                hintStyle:
                                CustomTextStyles.titleMediumBluegray400),
                            Padding(
                                padding: getPadding(top: 18),
                                child: Text("Hạn đăng tuyển",
                                    style:
                                    CustomTextStyles.titleSmallPrimary)),
                            DateTimePicker(
                              type: DateTimePickerType.date,
                              dateMask: 'dd/MM/yyyy',
                              initialValue: DateTime.now().toString(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101),
                              icon: Icon(Icons.event),
                              dateLabelText: 'Date',
                              onChanged: (val) {
                                setState(() {
                                  selectedDate = val;
                                });
                              },
                              validator: (val) {
                                // Custom validation logic if needed
                                return null;
                              },
                              onSaved: (val) {
                                // Save the selected date if needed
                              },

                            ),
                            Padding(
                                padding: getPadding(top: 18),
                                child: Text("Mức lương ",
                                    style:
                                    CustomTextStyles.titleSmallPrimary)),
                            CustomTextFormField(
                                controller: salaryController,
                                margin: getMargin(top: 9),
                                hintText: '3000USD',
                                hintStyle:
                                CustomTextStyles.titleMediumBluegray400),
                            Padding(
                                padding: getPadding(top: 18),
                                child: Text("Kinh nghiệm yêu cầu ",
                                    style:
                                    CustomTextStyles.titleSmallPrimary)),
                            CustomTextFormField(
                                controller: workExperienceController,
                                margin: getMargin(top: 9),
                                hintText: '3 năm',
                                hintStyle:
                                CustomTextStyles.titleMediumBluegray400),
                            Padding(
                                padding: getPadding(top: 18),
                                child: Text("Địa điểm làm việc",
                                    style:
                                    CustomTextStyles.titleSmallPrimary)),
                            CustomTextFormField(
                                controller: locationController,
                                margin: getMargin(top: 9),
                                hintText: 'HN',
                                hintStyle:
                                CustomTextStyles.titleMediumBluegray400,
                                ),
                            Padding(
                                padding: getPadding(top: 18),
                                child: Text("Mô tả công việc",
                                    style:
                                    CustomTextStyles.titleSmallPrimary)),
                            CustomTextFormField(
                                controller: descriptionController,
                                margin: getMargin(top: 9),
                                hintText: 'thông tin công việc',
                                hintStyle:
                                CustomTextStyles.titleMediumBluegray400,
                                textInputAction: TextInputAction.done,
                                maxLines: 6,
                                contentPadding: getPadding(
                                    left: 16, top: 20, right: 16, bottom: 20)),
                          ])))),
          bottomNavigationBar: Consumer<PostJobProvider>(builder: (context, postJobProvider, _) {
            return CustomElevatedButton(
              text: "Đăng tin",
              margin: getMargin(left: 24, right: 24, bottom: 40),
              buttonStyle: CustomButtonStyles.fillPrimary,
              onTap: postJobProvider.isLoading
                  ? null
                  : () async {

                final String title =
                    titleController.text;
                final String salary =
                    salaryController.text;
                final String location =
                    locationController.text;
                final String description =
                    descriptionController.text;
                final String workExperience =
                    workExperienceController.text;
                final String number =
                    numberController.text;
                Directory tempDir = await getTemporaryDirectory();
                String tempPath = tempDir.path;
                File htmlFile = createHtmlFile(tempPath, description);
                FormData userData = FormData.fromMap({
                  'description':await MultipartFile.fromFile(htmlFile.path, filename: 'document.html'),
                  'title':title,
                  'expirationDate':selectedDate,
                  'location':location,
                  'salary':salary,
                  'workExperience':workExperience,
                  'status':1,
                  'numberRecruit': number,
                });
                String? token = await getToken();
                await Provider.of<PostJobProvider>(context, listen: false)
                    .postJob(userData, token!, context);
                if (postJobProvider.succes) {
                  onTapSavechanges(context);
                }
              },
            );
          }),
        )
    );
  }
  File createHtmlFile(String tempPath, String text) {
    // Tạo một tệp HTML tạm thời trong thư mục lưu trữ tạm thời
    File file = File('$tempPath/document.html');

    // Mở tệp để ghi nội dung HTML
    file.writeAsStringSync('<html><body>$text</body></html>');

    return file;
  }

  onTapArrowbackone(BuildContext context) {
    Navigator.pop(context);
  }

  onTapSavechanges(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.homePageE);
  }
}
