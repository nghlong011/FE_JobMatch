import 'package:flutter/material.dart';
import 'package:nghlong011_s_application5/core/app_export.dart';
import 'package:nghlong011_s_application5/presentation/experience_setting_screen/experience_setting_screen.dart';
import 'package:nghlong011_s_application5/presentation/personal_info_screen/personal_info_screen.dart';

import 'package:nghlong011_s_application5/widgets/app_bar/appbar_image_1.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/appbar_title.dart';
import 'package:nghlong011_s_application5/widgets/app_bar/custom_app_bar.dart';

import 'package:nghlong011_s_application5/presentation/logout_popup_dialog/logout_popup_dialog.dart';

import '../change_password/change_password.dart';


// ignore_for_file: must_be_immutable
class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
      backgroundColor: appTheme.whiteA70001,
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
          title: AppbarTitle(text: "Cài đặt")),
      body: SizedBox(
          width: mediaQueryData.size.width,
          child: SingleChildScrollView(
              padding: getPadding(top: 28),
              child: Padding(
                  padding: getPadding(left: 24, right: 24, bottom: 5),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                                padding: getPadding(top: 32),
                                child: Text("Tài khoản",
                                    style:
                                        CustomTextStyles.labelLargeSemiBold))),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PersonalInfoScreen(),
                                ),
                              );
                            },
                            child: Padding(
                                padding: getPadding(top: 15),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      CustomImageView(
                                          svgPath: ImageConstant.imgPerson,
                                          height: getSize(24),
                                          width: getSize(24),
                                          margin: getMargin(top: 3)),
                                      Padding(
                                          padding: getPadding(left: 12, top: 5),
                                          child: Text("Thông tin cá nhân",
                                              style:
                                                  theme.textTheme.titleMedium)),
                                      Spacer(),
                                      CustomImageView(
                                          svgPath: ImageConstant
                                              .imgArrowrightPrimary,
                                          height: getSize(24),
                                          width: getSize(24),
                                          margin: getMargin(bottom: 3))
                                    ]))),
                        Padding(
                            padding: getPadding(top: 16),
                            child: Divider(indent: getHorizontalSize(36))),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ExperienceSettingScreen(),
                                ),
                              );
                            },
                            child: Padding(
                                padding: getPadding(top: 15),
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      CustomImageView(
                                          svgPath: ImageConstant.imgUserPrimary,
                                          height: getSize(24),
                                          width: getSize(24),
                                          margin: getMargin(top: 3)),
                                      Padding(
                                          padding: getPadding(left: 12, top: 7),
                                          child: Text("Kinh nghiệm làm việc",
                                              style:
                                                  theme.textTheme.titleMedium)),
                                      Spacer(),
                                      CustomImageView(
                                          svgPath: ImageConstant
                                              .imgArrowrightPrimary,
                                          height: getSize(24),
                                          width: getSize(24),
                                          margin: getMargin(bottom: 4))
                                    ]))),
                        Padding(
                            padding: getPadding(top: 14),
                            child: Divider(indent: getHorizontalSize(36))),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ChangePassScreen(),
                              ),
                            );
                          },
                          child: Padding(
                              padding: getPadding(top: 15),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    CustomImageView(
                                        svgPath: ImageConstant.imgShielddone,
                                        height: getSize(24),
                                        width: getSize(24)),
                                    Padding(
                                        padding: getPadding(left: 12, top: 4),
                                        child: Text("Đổi mật khẩu",
                                            style: theme.textTheme.titleMedium)),
                                    Spacer(),
                                    CustomImageView(
                                        svgPath:
                                        ImageConstant.imgArrowrightPrimary,
                                        height: getSize(24),
                                        width: getSize(24))
                                  ])),
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
                                },
                                child: Padding(
                                    padding: getPadding(top: 28),
                                    child: Text("Đăng xuất",
                                        style: CustomTextStyles
                                            .titleMediumRedA200))))
                      ])))),
    ));
  }

  onTapArrowbackone(BuildContext context) {
    Navigator.pop(context);
  }

  onTapAccount(BuildContext context) {
    Navigator.pushReplacementNamed(context, AppRoutes.personalInfoScreen);
  }

  onTapPrivacy(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.experienceSettingScreen);
  }


  onTapTxtLargelabelmediu(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              content: LogoutPopupDialog(),
              backgroundColor: Colors.transparent,
              contentPadding: EdgeInsets.zero,
              insetPadding: const EdgeInsets.only(left: 0),
            ));
  }
}
