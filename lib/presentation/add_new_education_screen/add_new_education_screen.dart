import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/appbar_image_1.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/appbar_title.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/custom_app_bar.dart';
import 'package:nghlong011_s_application5/widgets/custom_drop_down.dart';
import 'package:nghlong011_s_application5/widgets/custom_elevated_button.dart';
import 'package:nghlong011_s_application5/widgets/custom_outlined_button.dart';
import 'package:nghlong011_s_application5/widgets/custom_text_form_field.dart';

import '../../data/repository/update_profile.dart';

// ignore_for_file: must_be_immutable
class AddNewEducationScreen extends StatelessWidget {
  AddNewEducationScreen({Key? key}) : super(key: key);

  TextEditingController frameOneController = TextEditingController();

  List<String> dropdownItemList = ["2019", "2020", "2021"];

  TextEditingController frameoneoneController = TextEditingController();

  TextEditingController frameonetwoController = TextEditingController();

  TextEditingController groupEightyOneController = TextEditingController();

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
                title: AppbarTitle(text: "Thêm học vấn")),
            body: SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    padding: getPadding(top: 32),
                    child: Padding(
                        padding: getPadding(left: 24, right: 24, bottom: 5),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Trường Đại học", style: theme.textTheme.titleSmall),
                              CustomTextFormField(
                                  controller: frameOneController,
                                  margin: getMargin(top: 9),
                                  hintText: "Ex: Harvard University",
                                  hintStyle:
                                      CustomTextStyles.titleMediumBluegray400),
                              Padding(
                                  padding: getPadding(top: 20),
                                  child: Text("Năm học",
                                      style: theme.textTheme.titleSmall)),
                              CustomDropDown(
                                  icon: Container(
                                      margin: getMargin(left: 30, right: 24),
                                      child: CustomImageView(
                                          svgPath: ImageConstant
                                              .imgArrowdownGray900)),
                                  margin: getMargin(top: 7),
                                  hintText: "Ex: Bachelor",
                                  hintStyle:
                                      CustomTextStyles.titleMediumBluegray400,
                                  items: dropdownItemList,
                                  onChanged: (value) {}),
                              Padding(
                                  padding: getPadding(top: 20),
                                  child: Text("Ngành học",
                                      style: theme.textTheme.titleSmall)),
                              CustomTextFormField(
                                  controller: frameoneoneController,
                                  margin: getMargin(top: 7),
                                  hintText: "Ex: Business",
                                  hintStyle:
                                      CustomTextStyles.titleMediumBluegray400),
                              Padding(
                                  padding: getPadding(top: 18),
                                  child: Text("Năm bắt đầu",
                                      style: theme.textTheme.titleSmall)),
                              CustomOutlinedButton(
                                  height: getVerticalSize(52),
                                  text: "Chọn năm",
                                  margin: getMargin(top: 9),
                                  rightIcon: Container(
                                      margin: getMargin(left: 30),
                                      child: CustomImageView(
                                          svgPath: ImageConstant.imgCalendar)),
                                  buttonStyle: CustomButtonStyles.outlineIndigo,
                                  buttonTextStyle:
                                      CustomTextStyles.titleMediumBluegray400),
                              Padding(
                                  padding: getPadding(top: 18),
                                  child: Text("Năm kết thúc",
                                      style: theme.textTheme.titleSmall)),
                              CustomOutlinedButton(
                                  height: getVerticalSize(52),
                                  text: "Chọn năm",
                                  margin: getMargin(top: 9),
                                  rightIcon: Container(
                                      margin: getMargin(left: 30),
                                      child: CustomImageView(
                                          svgPath: ImageConstant.imgCalendar)),
                                  buttonStyle: CustomButtonStyles.outlineIndigo,
                                  buttonTextStyle:
                                      CustomTextStyles.titleMediumBluegray400),
                              Padding(
                                  padding: getPadding(top: 18),
                                  child: Text("Bằng",
                                      style: theme.textTheme.titleSmall)),
                              CustomTextFormField(
                                  controller: frameonetwoController,
                                  margin: getMargin(top: 9),
                                  hintText: "Ex: Business",
                                  hintStyle:
                                      CustomTextStyles.titleMediumBluegray400),
                              Padding(
                                  padding: getPadding(top: 20),
                                  child: Text("Mô tả",
                                      style: theme.textTheme.titleSmall)),
                              CustomTextFormField(
                                  controller: groupEightyOneController,
                                  margin: getMargin(top: 7),
                                  hintText: "Lorem ipsun",
                                  hintStyle:
                                      CustomTextStyles.titleMediumBluegray400,
                                  textInputAction: TextInputAction.done,
                                  maxLines: 6,
                                  contentPadding: getPadding(
                                      left: 16, top: 20, right: 16, bottom: 20))
                            ])))),
            bottomNavigationBar: Consumer<UpdateProfile>(builder: (context, updateProfile, _) {
              return CustomElevatedButton(
                text: "Lưu",
                margin: getMargin(left: 24, right: 24, bottom: 40),
                buttonStyle: CustomButtonStyles.fillPrimary,
                onTap: updateProfile.isLoading
                    ? null
                    : () async {
                  final String name =
                      frameOneController.text;

                  FormData userData = FormData.fromMap({
                    'education': name,
                  });
                  String? token = await getToken();
                  await Provider.of<UpdateProfile>(context, listen: false)
                      .updateProfile(userData, token!, context);
                  if (updateProfile.succes) {
                    onTapSavechanges(context);
                  }
                },
              );
            }),
        )
    );
  }


  onTapArrowbackone(BuildContext context) {
    Navigator.pop(context);
  }


  onTapSavechanges(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.experienceSettingScreen);
  }
}
