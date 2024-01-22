import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/appbar_image_1.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/appbar_title.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/custom_app_bar.dart';
import 'package:nghlong011_s_application5/widgets/custom_elevated_button.dart';
import 'package:nghlong011_s_application5/presentation/apply_job_popup_dialog/apply_job_popup_dialog.dart';

import 'ApplyJobProvider.dart';

// ignore_for_file: must_be_immutable
class ApplyJobScreen extends StatelessWidget {
  final Map<String, dynamic> jobDetails;
  ApplyJobScreen({
    Key? key,
    required this.jobDetails,
  }) : super(key: key);

  TextEditingController fullNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController frameOneController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    File? file;
    int? jobId;
    int? status;
    return SafeArea(
        child: Scaffold(
      backgroundColor: appTheme.whiteA70001,
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
          height: getVerticalSize(51),
          leadingWidth: getHorizontalSize(48),
          leading: AppbarImage1(
              svgPath: ImageConstant.imgGroup162799,
              margin: getMargin(left: 24, top: 13, bottom: 14),
              onTap: () {
                onTapArrowbackone(context);
              }),
          centerTitle: true,
          title: AppbarTitle(text: "Ứng tuyển")),
      body: Form(
          key: _formKey,
          child: Container(
              width: double.maxFinite,
              padding: getPadding(left: 24, top: 31, right: 24, bottom: 31),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: getPadding(top: 28),
                        child: Text("Tải CV",
                            style: CustomTextStyles.titleSmallPrimary)),
                    Padding(
                        padding: getPadding(top: 7),
                        child: DottedBorder(
                            color: appTheme.indigo50,
                            padding: EdgeInsets.only(
                                left: getHorizontalSize(1),
                                top: getVerticalSize(1),
                                right: getHorizontalSize(1),
                                bottom: getVerticalSize(1)),
                            strokeWidth: getHorizontalSize(1),
                            radius: Radius.circular(24),
                            borderType: BorderType.RRect,
                            dashPattern: [6, 6],
                            child: Container(
                                padding: getPadding(
                                    left: 125, top: 39, right: 125, bottom: 39),
                                decoration: AppDecoration.outlineIndigo501
                                    .copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder24),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CustomImageView(
                                          onTap: () async {
                                            FilePickerResult? result =
                                                await FilePicker.platform
                                                    .pickFiles();
                                            if (result != null) {
                                              String? filePath =
                                                  result.files.single.path;

                                              if (filePath != null) {
                                                file = File(filePath);
                                                jobId = jobDetails['jobId'];
                                                status = 1;
                                              }
                                            } else {
                                              // Người dùng không chọn file
                                            }
                                          },
                                          svgPath:
                                              ImageConstant.imgCloudupload1,
                                          height: getSize(40),
                                          width: getSize(40)),
                                      Padding(
                                          padding: getPadding(top: 8),
                                          child: Text("Tải file",
                                              style: CustomTextStyles
                                                  .titleSmallPrimarySemiBold))
                                    ])))),
                  ]))),
      bottomNavigationBar:
          Consumer<ApplyJobProvider>(builder: (context, applyJobProvider, _) {
        return CustomElevatedButton(
          text: "Ứng tuyển",
          margin: getMargin(left: 24, right: 24, bottom: 40),
          buttonStyle: CustomButtonStyles.fillPrimary,
          onTap: applyJobProvider.isLoading
              ? null
              : () async {
                  String? token = await getToken();
                  Map<String, dynamic>? decodedToken =
                      JwtDecoder.decode(token!);
                  String? userName = decodedToken['sub'];
                  String fileName = file!.path.split('/').last;
                  FormData userData = FormData.fromMap({
                    'name': userName,
                    'jobId': jobId,
                    'status': status,
                    'content': await MultipartFile.fromFile(
                      file!.path,
                      filename: fileName,
                    ),
                  });

                  await Provider.of<ApplyJobProvider>(context, listen: false)
                      .jobApp(userData, token, context);
                  if (applyJobProvider.succes) {
                    onTapContinue(context);
                  }
                },
        );
      }),
    ));
  }

  onTapArrowbackone(BuildContext context) {
    Navigator.pop(context);
  }

  onTapContinue(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: ApplyJobPopupDialog(),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }
}
