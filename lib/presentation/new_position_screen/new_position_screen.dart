import 'package:flutter/material.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/appbar_image_1.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/appbar_title.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/custom_app_bar.dart';
import 'package:nghlong011_s_application5/widgets/custom_drop_down.dart';
import 'package:nghlong011_s_application5/widgets/custom_elevated_button.dart';
import 'package:nghlong011_s_application5/widgets/custom_outlined_button.dart';
import 'package:nghlong011_s_application5/widgets/custom_text_form_field.dart';

// ignore_for_file: must_be_immutable
class NewPositionScreen extends StatelessWidget {
  NewPositionScreen({Key? key}) : super(key: key);

  TextEditingController frameOneController = TextEditingController();

  List<String> dropdownItemList = ["Item One", "Item Two", "Item Three"];

  TextEditingController nameController = TextEditingController();

  TextEditingController locationController = TextEditingController();

  TextEditingController groupTwentySeveController = TextEditingController();

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
                title: AppbarTitle(text: "Thêm Kinh nghiệm ")),
            body: SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    padding: getPadding(top: 36),
                    child: Padding(
                        padding: getPadding(left: 24, right: 24, bottom: 5),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Tên chức vụ", style: theme.textTheme.titleSmall),
                              CustomTextFormField(
                                  controller: frameOneController,
                                  margin: getMargin(top: 9),
                                  hintText: "Ex: UI Designer",
                                  hintStyle:
                                      CustomTextStyles.titleMediumBluegray400),
                              Container(
                                  margin: getMargin(top: 20),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadiusStyle.roundedBorder8),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text("Ngành",
                                            style: theme.textTheme.titleSmall),
                                        CustomDropDown(
                                            icon: Container(
                                                margin: getMargin(
                                                    left: 30, right: 19),
                                                child: CustomImageView(
                                                    svgPath: ImageConstant
                                                        .imgArrowdown)),
                                            margin: getMargin(top: 7),
                                            hintText: "Please Select",
                                            hintStyle: CustomTextStyles
                                                .titleMediumBluegray400,
                                            items: dropdownItemList,
                                            onChanged: (value) {})
                                      ])),
                              Padding(
                                  padding: getPadding(top: 20),
                                  child: Text("Tên công ty",
                                      style: theme.textTheme.titleSmall)),
                              CustomTextFormField(
                                  controller: nameController,
                                  margin: getMargin(top: 7),
                                  hintText: "Ex: Shopee",
                                  hintStyle:
                                      CustomTextStyles.titleMediumBluegray400),
                              Padding(
                                  padding: getPadding(top: 18),
                                  child: Text("Vị trí ",
                                      style: theme.textTheme.titleSmall)),
                              CustomTextFormField(
                                  controller: locationController,
                                  margin: getMargin(top: 9),
                                  hintText: "",
                                  hintStyle:
                                      CustomTextStyles.titleMediumBluegray400),
                              Padding(
                                  padding: getPadding(top: 18),
                                  child: Text("Thời gian bắt đầu",
                                      style: theme.textTheme.titleSmall)),
                              CustomOutlinedButton(
                                  height: getVerticalSize(52),
                                  text: "Chọn ngày",
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
                                  child: Text("Thời gian kết thúc",
                                      style: theme.textTheme.titleSmall)),
                              CustomOutlinedButton(
                                  height: getVerticalSize(52),
                                  text: "Chọn ngày",
                                  margin: getMargin(top: 9),
                                  rightIcon: Container(
                                      margin: getMargin(left: 30),
                                      child: CustomImageView(
                                          svgPath: ImageConstant.imgCalendar)),
                                  buttonStyle: CustomButtonStyles.outlineIndigo,
                                  buttonTextStyle:
                                      CustomTextStyles.titleMediumBluegray400),
                              Padding(
                                  padding: getPadding(top: 20),
                                  child: Text("Mô tả công việc",
                                      style: theme.textTheme.titleSmall)),
                              CustomTextFormField(
                                  controller: groupTwentySeveController,
                                  margin: getMargin(top: 7),
                                  hintText: "Lorem ipsun",
                                  hintStyle:
                                      CustomTextStyles.titleMediumBluegray400,
                                  textInputAction: TextInputAction.done,
                                  maxLines: 6,
                                  contentPadding: getPadding(
                                      left: 16, top: 20, right: 16, bottom: 20))
                            ])))),
            bottomNavigationBar: CustomElevatedButton(
                text: "Lưu thay đổi",
                margin: getMargin(left: 24, right: 24, bottom: 37),
                buttonStyle: CustomButtonStyles.fillPrimary,
                onTap: () {
                  onTapSavechanges(context);
                })));
  }

  /// Navigates back to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is used
  /// to navigate back to the previous screen.
  onTapArrowbackone(BuildContext context) {
    Navigator.pop(context);
  }

  /// Navigates to the experienceSettingScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [Navigator] widget
  /// to push the named route for the experienceSettingScreen.
  onTapSavechanges(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.experienceSettingScreen);
  }
}
